import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NoSearchResult extends StatelessWidget {
  const NoSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Please Search for results",
        style: Styles.textSize22,
      ),
    );
  }
}
