import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22.0),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image:
                DecorationImage(fit: BoxFit.fill, image: image.isNotEmpty? NetworkImage(image): AssetImage(AssetsData.placeholderImage)),
          ),
        ),
      ),
    );
  }
}
