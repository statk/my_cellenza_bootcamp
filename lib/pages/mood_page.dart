import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_cellenza_bootcamp/data/dtos/company_rating_dto.dart';
import 'package:my_cellenza_bootcamp/data/dtos/rating_dto.dart';
import 'package:my_cellenza_bootcamp/data/rating_repository.dart';
import 'package:my_cellenza_bootcamp/pages/page.dart';
import 'package:my_cellenza_bootcamp/plugins/headers.dart';
import 'package:my_cellenza_bootcamp/plugins/snack_bar_dialog.dart';
import 'package:my_cellenza_bootcamp/plugins/success_animation.dart';
import 'package:my_cellenza_bootcamp/plugins/widget_button.dart';
import 'package:my_cellenza_bootcamp/plugins/widget_rating.dart';

class MoodPage extends StatefulWidget {
  const MoodPage() : super(key: const Key('MoodPage'));

  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> with TickerProviderStateMixin, SuccessAnimation {
  final RatingRepository _ratingRepository = RatingRepository(Dio());
  RatingDto? _rating;

  @override
  initState() {
    super.initState();

    initSuccessAnimation(this);
  }

  Future _getRating() async {
    var currentRating = await _ratingRepository.getRating(DateTime.now().toString());
    setState(() {
      _rating = currentRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetPage(
        appBar: AppBar(
          title: const Text('NOTE D\'HUMEUR'),
        ),
        widget: Center(
          child: Column(
            children: [
              const Text('Comment te sens-tu chez Cellenza ?'),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Note de 1 à 10',
                  ),
                  onChanged: (value) => setState(() {
                        if (_rating?.companyRating == null) {
                          _rating = RatingDto()..companyRating = CompanyRatingDto();
                        }
                        _rating!.companyRating!.companyRating = int.parse(value);
                      })),
              const Text('Comment te sens-tu en mission ?'),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Note de 1 à 10',
                ),
                onChanged: (value) => setState(() {
                  if (_rating?.companyRating == null) {
                    _rating = RatingDto()..companyRating = CompanyRatingDto();
                  }
                  _rating?.companyRating?.missionRating = int.parse(value);
                }),
              ),
              const Text('Recommenders-tu Cellenza à un ami ?'),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Note de 1 à 10',
                ),
                onChanged: (value) => setState(() {
                  if (_rating?.companyRating == null) {
                    _rating = RatingDto()..companyRating = CompanyRatingDto();
                  }
                  _rating?.companyRating?.recommendationRating = int.parse(value);
                }),
              ),
              const Text('J\'aurais mis 10 si :'),
              TextField(
                  decoration: const InputDecoration(),
                  onChanged: (value) => setState(() {
                        if (_rating?.companyRating == null) {
                          _rating = RatingDto()..companyRating = CompanyRatingDto();
                        }
                        _rating?.companyRating?.comments = value;
                      })),
              OutlinedButton(
                onPressed: () async {
                  await _ratingRepository.postRating(_rating!, DateTime.now().toString());
                  await _getRating();
                },
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ));
  }
}
