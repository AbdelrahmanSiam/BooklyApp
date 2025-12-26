import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_book_action_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_button.dart';
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
      child: CustomScrollView( // to can use Expanded widgets inside it
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomBookDetailsViewAppBar(),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .35,
              child: CustomBookItem(
                image:
                    "https://img.freepik.com/free-vector/books-stack-realistic_1284-4735.jpg?semt=ais_hybrid&w=740&q=80",
              ),
            ),
            SizedBox(
              height: 43,
            ),
            Text(
              "The Jungle Book",
              style: Styles.textSize30.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Rudyard Kipling",
              style: Styles.textSize16.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            BookRatingRow(),
            SizedBox(
              height: 37,
            ),
            BooksButton(),
            Expanded(
              child: SizedBox(
                height: 37,
              ),
            ),
            Align(
              // to make only this text at the start
              alignment: Alignment.centerLeft,
              child: Text(
                "You can also read",
                style: Styles.textSize22,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            BookDetailsListView(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
          )
        ],
      )
    );
  }
}
