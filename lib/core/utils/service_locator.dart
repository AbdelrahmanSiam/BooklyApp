import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/network/api_services.dart';
import 'package:bookly/core/storage/hive_service.dart';
import 'package:bookly/features/favorite/data/repo/favorite_books_repo_implementation.dart';
import 'package:bookly/features/home/data/repoes/home_repo_implementation.dart';
import 'package:bookly/features/search/data/repo/search_repo_implementaion.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final getIt = GetIt.instance; // getIt is global variable

void setupServiceLocator(Box<BookModel> favoriteBox) {
  // global method also

  getIt.registerSingleton(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImplementaion>(
    SearchRepoImplementaion(
      apiServices: getIt.get<ApiServices>(),
    ),
  ); // we can call it every time we use HomeRepoImplementation class

  getIt.registerSingleton<Box<BookModel>>((favoriteBox));
  getIt.registerSingleton<HiveService>(
    HiveService(
      favoriteBox: getIt.get<Box<BookModel>>(),
    ),
  );

  getIt.registerSingleton<FavoriteBooksRepoImplementation>(
      FavoriteBooksRepoImplementation(hiveService: getIt.get<HiveService>(),),);
}
