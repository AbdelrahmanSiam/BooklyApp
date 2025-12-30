import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/repoes/home_repo_implementation.dart';
import 'package:bookly/features/search/data/repo/search_repo_implementaion.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance; // getIt is global variable

void setupServiceLocator() {
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
}
