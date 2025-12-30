import 'package:bookly/core/widgets/custom_failure_widget.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_view_item.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccessState) {
            if (state.searchBooks.isEmpty) {
              return const Center(
                child: Text('No results found'),
              );
            }

            return ListView.builder(
              itemCount: state.searchBooks.length,
              itemBuilder: (context, index) {
                return BookInfoListViewItem(
                  bookModel: state.searchBooks[index],
                );
              },
            );
          } else if (state is SearchFailureState) {
            return CustomFailureWidget(
              errMessage: state.errMessage,
            );
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
