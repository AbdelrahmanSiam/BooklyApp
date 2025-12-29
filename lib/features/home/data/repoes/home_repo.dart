import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // Good at collerbration teams ,Its methods can implemented in different ways , make it east to shift to Clean Arc
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  // we use dartz package for handling errors by using Either<L,R> one for failure fetching and the other for sucsses fetching
  Future<Either<Failure, List<BookModel>>> fetchRelevenceBooks(
      {required String category});
}
