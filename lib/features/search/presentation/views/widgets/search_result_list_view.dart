import 'package:bookly/features/home/presentation/views/widgets/book_info_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (contex, index) {
            // return BookInfoListViewItem();
            return Text("data");
          }),
    );
  }
}
