part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<BookModel> searchBooks;

  const SearchSuccessState({required this.searchBooks});
}

final class SearchLoadingState extends SearchState {}

final class SearchFailureState extends SearchState {
  final String errMessage;

  const SearchFailureState({required this.errMessage});
}
