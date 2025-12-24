
import 'package:bookly/features/home/presentation/views/widgets/horizontal_List_view_card.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return HorizontalListViewCard();
          }),
    );
  }
}