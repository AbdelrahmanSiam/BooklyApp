import 'package:bookly/constants.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/models/book_model/image_links.dart';
import 'package:bookly/core/models/book_model/volume_info.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/favorite/data/repo/favorite_books_repo_implementation.dart';
import 'package:bookly/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:bookly/features/home/data/repoes/home_repo_implementation.dart';
import 'package:bookly/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newest_cubit/newest_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(VolumeInfoAdapter());
  Hive.registerAdapter(ImageLinksAdapter());
  final favoriteBox =await Hive.openBox<BookModel>(kFavoriteBox);
  setupServiceLocator(favoriteBox);
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())
                ..getFeaturedBooksMethod(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImplementation>())
                ..getNewestBooksMethod(),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteCubit(getIt.get<FavoriteBooksRepoImplementation>())
                ..fetchAllListOfFavoriteBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark()
                .textTheme, // default is light and we want it to be dark
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
