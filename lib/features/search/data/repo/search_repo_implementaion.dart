import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementaion implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImplementaion({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String bookName}) async {
    try {
      final data = await apiServices.get(
        endPoints: 'volumes',
        queryParameters: {
          'q': bookName,
          'maxResults': 10,
        },
      );
      List<BookModel> booksList = [];

      for (var item in data['items']) {
        booksList.add(BookModel.fromBookJson(item));
      }
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
