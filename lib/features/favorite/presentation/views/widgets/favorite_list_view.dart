import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_failure_widget.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_view_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteInitialState ||
            (state is FavoriteSuccessState && state.favoriteBooks.isEmpty)) {
          return const Center(
            child: Text(
              "No favorite books yet ❤️",
              style: Styles.textSize22,
            ),
          );
        } else if (state is FavoriteSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.favoriteBooks.length,
            itemBuilder: (context, index) {
              return BookInfoListViewItem(
                bookModel: state.favoriteBooks[index],
              );
            },
          );
        } else if (state is FavoriteFailureState) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
