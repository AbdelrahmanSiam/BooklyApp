import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 115,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 3.1 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsData.testImage),
                  ),
                ),
              ),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "Harry Poter",
                  style: Styles.textSize20,
                ),
                Text(
                  "J.K.Rowling",
                  style: Styles.textSize16,
                ),
                Row(
                  children: [
                    Text(
                      "19.99",
                      style: Styles.textSize22.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "rating",
                      style: Styles.textSize22.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "(2222)",
                      style: Styles.textSize16,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
