import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_book_action_button.dart';
import 'package:flutter/material.dart';

class BooksButton extends StatelessWidget {
  const BooksButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBookActionButton(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Text(
              "19.99",
              style: Styles.textSize20.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          CustomBookActionButton(
            backgroundColor: Color(0xffEF8262),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              overflow: TextOverflow.ellipsis,
              "Free preview",
              style: Styles.textSize16.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
