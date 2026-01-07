import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsViewAppBar extends StatelessWidget {
  const CustomBookDetailsViewAppBar({super.key, required this.bookModel});
  final BookModel bookModel;

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
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              bool isFav =
                  BlocProvider.of<FavoriteCubit>(context).isFav(bookModel.id);
              return IconButton(
                onPressed: () {
                  BlocProvider.of<FavoriteCubit>(context).toggleFav(bookModel);
                },
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              );
            },
          ),
      ],
    );
  }
}
