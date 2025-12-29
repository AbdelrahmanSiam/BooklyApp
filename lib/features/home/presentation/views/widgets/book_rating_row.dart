import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRatingRow extends StatelessWidget {
  const BookRatingRow(
      {super.key, required this.ratingAverage, required this.ratingCount});

  final double ratingAverage;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amberAccent,
          size: 16,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "$ratingAverage",
          style: Styles.textSize20.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "($ratingCount)",
          style: Styles.textSize16,
        ),
      ],
    );
  }
}
