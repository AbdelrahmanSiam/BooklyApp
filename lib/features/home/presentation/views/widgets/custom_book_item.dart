import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/features/home/presentation/views/widgets/bookItem.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.image});
  final String image;

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
            child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite),
        ),
          ),
        ],
      ),
    );
  }
}
