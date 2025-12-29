import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookInfoListViewItem extends StatelessWidget {
  const BookInfoListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          height: 130,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 3.1 / 4,
                  child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                          AssetsData.placeholderImage),
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo?.title ?? '',
                        style: Styles.textSize20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      bookModel.volumeInfo?.authors?.first ?? '',
                      style: Styles.textSize16,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            // "€ ${bookModel.saleInfo?.saleability}",
                            'Free',
                            style: Styles.textSize20
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Spacer(),
                          BookRatingRow(
                            ratingAverage: bookModel.volumeInfo?.averageRating ?? 0.0,
                            ratingCount: bookModel.volumeInfo?.ratingsCount ?? 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
