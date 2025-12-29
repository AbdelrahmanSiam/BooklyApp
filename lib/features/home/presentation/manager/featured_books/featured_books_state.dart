part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedCubitInitial extends FeaturedBooksState {}

final class FeaturedBooksSuccessState extends FeaturedBooksState {
  // we decide what will return if succes ? List of books
  final List<BookModel> books;
  const FeaturedBooksSuccessState({required this.books});
}

final class FeaturedBooksLoadingState extends FeaturedBooksState {}

final class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksFailureState({required this.errMessage});
}
