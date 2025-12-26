import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_book_action_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_first_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_second_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_view_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/horizontal_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // SafeArea build screen after default statless appBar
        child: CustomScrollView(
      // to can use Expanded widgets inside it
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BooksDetailsFirstSection(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                BooksDetailsSecondSection(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
