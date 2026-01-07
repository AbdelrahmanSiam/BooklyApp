import 'package:bookly/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoriteAppBar extends StatelessWidget {
  const FavoriteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.close,
            )),
        IconButton(
          onPressed: () {
            BlocProvider.of<FavoriteCubit>(context).clearAllFavBooks();
          },
          icon: Icon(
            Icons.delete_forever_outlined,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
