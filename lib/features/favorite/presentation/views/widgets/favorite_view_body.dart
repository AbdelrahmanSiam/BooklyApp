import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/favorite/presentation/views/widgets/favorite_list_view.dart';
import 'package:flutter/material.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Favorite Books ",
              style: Styles.textSize22,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FavoriteListView(),
        ],
      ),
    );
  }
}
