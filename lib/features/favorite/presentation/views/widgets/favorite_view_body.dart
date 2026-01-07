import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_failure_widget.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:bookly/features/favorite/presentation/views/widgets/favorite_app_bar.dart';
import 'package:bookly/features/favorite/presentation/views/widgets/favorite_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                FavoriteAppBar(),
                const SizedBox(height: 30),
                Text(
                  "Favorite Books",
                  style: Styles.textSize22,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          sliver: SliverFillRemaining(child: FavoriteListView()),
        ),
      ],
    );
  }
}
