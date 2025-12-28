import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repoes/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices
      apiServices; // we will create obj from ApiServices class to get its method (not static)
  HomeRepoImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
          endPoints:
              "volumes?q=subject:Programming&Filtering=free-ebooks&Sorting=newest");
      // data is map (items) that holds these endPoints specifically from the api, but i need list so we use for loop to loop on this map and get the lists(item)
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromBookJson(item)); // item = bookModel
      }
      return right(books); // Either<left, right >>
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
          endPoints:
              "volumes?q=subject:Programming&Filtering=free-ebooks");
      // data is map (items) that holds these endPoints specifically from the api, but i need list so we use for loop to loop on this map and get the lists(item)
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromBookJson(item)); // item = bookModel
      }
      return right(books); // Either<left, right >>
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
