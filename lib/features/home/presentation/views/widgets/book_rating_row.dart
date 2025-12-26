import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRatingRow extends StatelessWidget {
  const BookRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amberAccent,
          size: 18,
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          "4.8",
          style: Styles.textSize22.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "(2222)",
          style: Styles.textSize16,
        ),
      ],
    );
  }
}
