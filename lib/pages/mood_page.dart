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
      appBar: AppBarHeader().createAppBar(context, 'NOTE D\'HUMEUR'),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 20),
          WidgetRating(
            description: 'Comment te sens-tu chez Cellenza ?',
            onRatingChanged: (newRating) => setState(() {
              if (_rating?.companyRating == null) {
                _rating = RatingDto()..companyRating = CompanyRatingDto();
              }
              _rating!.companyRating!.companyRating = (newRating * 2).round();
            }),
          ),
          WidgetRating(
              description: 'Comment te sens-tu en mission ?',
              onRatingChanged: (rating) => setState(() {
                    if (_rating?.companyRating == null) {
                      _rating = RatingDto()..companyRating = CompanyRatingDto();
                    }
                    _rating!.companyRating!.missionRating = (rating * 2).round();
                  })),
          WidgetRating(
              description: 'Recommenders-tu Cellenza à un ami ?',
              onRatingChanged: (rating) => setState(() {
                    if (_rating?.companyRating == null) {
                      _rating = RatingDto()..companyRating = CompanyRatingDto();
                    }
                    _rating!.companyRating!.recommendationRating = (rating * 2).round();
                  })),
          const Text('J\'aurais mis 10 si :', style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
                decoration: const InputDecoration(),
                onChanged: (value) => setState(() {
                      if (_rating?.companyRating == null) {
                        _rating = RatingDto()..companyRating = CompanyRatingDto();
                      }
                      _rating?.companyRating?.comments = value;
                    })),
          ),
          WidgetButton(
            title: 'Enregistrer',
            onPressed: () async {
              await _ratingRepository.postRating(_rating!, DateTime.now().toString());
              await _getRating();
              showSuccessAnimation(context);
              SnackBarDialog().show('Merci de saisir l\'ensemble des notes', context, SnackBarType.error);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
