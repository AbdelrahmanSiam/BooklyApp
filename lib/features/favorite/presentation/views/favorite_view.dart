import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/favorite/presentation/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FavoriteViewBody()),
    );
  }
}
