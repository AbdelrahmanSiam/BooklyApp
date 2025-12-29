import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_view_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BooksDetailsFirstSection extends StatelessWidget {
  const BooksDetailsFirstSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookDetailsViewAppBar(),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .35,
          child: CustomBookItem(
            image:
                bookModel.volumeInfo?.imageLinks?.thumbnail ?? AssetsData.placeholderImage,
          ),
        ),
        SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo?.title ?? '',
          textAlign: TextAlign.center,
          style: Styles.textSize30.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          bookModel.volumeInfo?.authors?.first ?? '',
          style: Styles.textSize16.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        BookRatingRow(
          ratingAverage: bookModel.volumeInfo?.averageRating ?? 0.0,
          ratingCount: bookModel.volumeInfo?.ratingsCount ?? 0,
        ),
        SizedBox(
          height: 37,
        ),
        BooksButton(),
      ],
    );
  }
}
