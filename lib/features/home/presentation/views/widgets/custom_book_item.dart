import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/bookItem.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.image, required this.bookModel});
  final String image;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22.0),
      child: Stack(
        children: [
          BookItem(image: image),
          Positioned(
            top: 5,
            right: 5,
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                bool isFav =
                    BlocProvider.of<FavoriteCubit>(context).isFav(bookModel.id);
                return isFav
                    ? IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      )
                    : Text("");
              },
            ),
          ),
        ],
      ),
    );
  }
}
