part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitialState extends FavoriteState {}

final class FavoriteLoadingState extends FavoriteState {}

final class FavoriteSuccessState extends FavoriteState {
  final List<BookModel> favoriteBooks;

  const FavoriteSuccessState({required this.favoriteBooks});
}

final class FavoriteFailureState extends FavoriteState {
  final String errMessage;

  const FavoriteFailureState({required this.errMessage});
}
