import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_list_view.dart';
import 'package:flutter/material.dart';

class BooksDetailsSecondSection extends StatelessWidget {
  const BooksDetailsSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also read",
          style: Styles.textSize22,
        ),
        SizedBox(
          height: 16,
        ),
        BookDetailsListView(),
      ],
    );
  }
}
