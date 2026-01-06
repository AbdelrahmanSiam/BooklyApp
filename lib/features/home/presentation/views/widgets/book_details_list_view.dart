import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/widgets/custom_failure_widget.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/presentation/manager/relevent_books/relevence_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelevenceCubit, RelevenceState>(
      builder: (context, state) {
        if (state is RelevenceSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomBookItem(
                  image:
                      state.books[index].volumeInfo?.imageLinks?.thumbnail ?? AssetsData.placeholderImage,
                );
              },
            ),
          );
        } else if (state is RelevenceFailureState) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
