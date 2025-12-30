import 'package:bookly/core/functions/launch_url_method.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_book_action_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksButton extends StatelessWidget {
  const BooksButton({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

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
              "Free",
              style: Styles.textSize20.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          CustomBookActionButton(
            onPressed: () async {
              launchUrlMethod(context, bookModel.volumeInfo!.previewLink!);
            },
            backgroundColor: Color(0xffEF8262),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              overflow: TextOverflow.ellipsis,
              getText(bookModel),
              style: Styles.textSize16.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo?.previewLink == null) {
      return "Not Available";
    } else {
      return "Preview";
    }
  }
}
