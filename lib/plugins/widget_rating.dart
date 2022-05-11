import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

class WidgetRating extends StatelessWidget {
  final Function(double) _onRatingChanged;
  final String _description;
  const WidgetRating({Key? key, required String description, required Function(double) onRatingChanged})
      : _onRatingChanged = onRatingChanged,
        _description = description,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(_description, style: const TextStyle(fontSize: 20)),
      RatingBar.builder(
        itemCount: 5,
        minRating: 1,
        allowHalfRating: true,
        direction: Axis.horizontal,
        itemBuilder: (context, _) => Lottie.asset('./lib/assets/rating-star.json', repeat: false),
        onRatingUpdate: (rating) => _onRatingChanged(rating),
      )
    ]);
  }
}
