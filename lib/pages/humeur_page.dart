import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_cellenza_bootcamp/data/dtos/rating_dto.dart';
import 'package:my_cellenza_bootcamp/data/rating_repository.dart';

class HumeurPage extends StatefulWidget {
  @override
  _HumeurPageState createState() => _HumeurPageState();
}

class _HumeurPageState extends State<HumeurPage> {
  final RatingRepository _ratingRepository = RatingRepository(Dio());
  RatingDto? _rating;

  @override
  initState() {
    super.initState();
  }

  Future _getRating() async {
    var currentRating = await _ratingRepository.getRating(DateTime.now().toString());
    setState(() {
      _rating = currentRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Humeur du mois'),
      ),
      body: Center(
        child: Text('Courrant humeur ${_rating?.companyRating?.companyRating ?? 0} '),
      ),
    );
  }
}
