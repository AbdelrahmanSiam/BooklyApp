import 'package:bookly/features/home/presentation/views/widgets/book_info_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (contex, index) {
          return BookInfoListViewItem();
        });
  }
}
