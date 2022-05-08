import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:my_cellenza_bootcamp/data/dtos/company_rating_dto.dart';
import 'package:my_cellenza_bootcamp/data/dtos/rating_dto.dart';
import 'package:my_cellenza_bootcamp/data/rating_repository.dart';
import 'package:my_cellenza_bootcamp/pages/page.dart';

class MoodPage extends StatefulWidget {
  const MoodPage() : super(key: const Key('MoodPage'));

  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> with TickerProviderStateMixin {
  final RatingRepository _ratingRepository = RatingRepository(Dio());
  RatingDto? _rating;
  OverlayEntry? _successOverlay;
  AnimationController? _successAnimationController;

  @override
  initState() {
    super.initState();

    _successAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _successAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _successOverlay?.remove();
      }
    });

    _successOverlay = OverlayEntry(
        builder: (context) => Lottie.asset(
              './lib/assets/congratulations-animation.json',
              controller: _successAnimationController,
              onLoaded: (_) => _successAnimationController?.forward(),
            ));
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
        elevation: 10,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
        toolbarHeight: 100,
        shadowColor: Colors.black,
        backgroundColor: const Color.fromRGBO(101, 147, 231, 1),
        title: Text('NOTE D\'HUMEUR'),
      ),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 20),
          const Text('Comment te sens-tu chez Cellenza ?'),
          RatingBar.builder(
              itemCount: 5,
              minRating: 1,
              allowHalfRating: true,
              direction: Axis.horizontal,
              itemBuilder: (context, _) => Lottie.asset('./lib/assets/rating-star.json', repeat: false),
              onRatingUpdate: (rating) => setState(() {
                    if (_rating?.companyRating == null) {
                      _rating = RatingDto()..companyRating = CompanyRatingDto();
                    }
                    _rating!.companyRating!.companyRating = (rating * 2).round();
                  })),
          const Text('Comment te sens-tu en mission ?'),
          RatingBar.builder(
              itemCount: 5,
              minRating: 1,
              allowHalfRating: true,
              direction: Axis.horizontal,
              itemBuilder: (context, _) => Lottie.asset('./lib/assets/rating-star.json', repeat: false),
              onRatingUpdate: (rating) => setState(() {
                    if (_rating?.companyRating == null) {
                      _rating = RatingDto()..companyRating = CompanyRatingDto();
                    }
                    _rating!.companyRating!.missionRating = (rating * 2).round();
                  })),
          const Text('Recommenders-tu Cellenza à un ami ?'),
          RatingBar.builder(
              itemCount: 5,
              minRating: 1,
              allowHalfRating: true,
              direction: Axis.horizontal,
              itemBuilder: (context, _) => Lottie.asset('./lib/assets/rating-star.json', repeat: false),
              onRatingUpdate: (rating) => setState(() {
                    if (_rating?.companyRating == null) {
                      _rating = RatingDto()..companyRating = CompanyRatingDto();
                    }
                    _rating!.companyRating!.recommendationRating = (rating * 2).round();
                  })),
          const Text('J\'aurais mis 10 si :'),
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
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              elevation: MaterialStateProperty.all<double>(10),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(color: Colors.white)),
              shadowColor: MaterialStateProperty.all<Color>(Colors.black54),
              fixedSize: MaterialStateProperty.all<Size>(Size(200, 50)),
            ),
            onPressed: () async {
              //await _ratingRepository.postRating(_rating!, DateTime.now().toString());
              //await _getRating();
              _successOverlay = OverlayEntry(
                  builder: (context) => Lottie.asset(
                        './lib/assets/congratulations-animation.json',
                        controller: _successAnimationController,
                        onLoaded: (_) => _successAnimationController?.forward(),
                      ));
              Overlay.of(context)?.insert(_successOverlay!);
              _successAnimationController?.forward();
            },
            child: const Text('Enregistrer'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
