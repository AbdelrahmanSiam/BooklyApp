part of 'featured_cubit_cubit.dart';

sealed class FeaturedCubitState extends Equatable {
  const FeaturedCubitState();

  @override
  List<Object> get props => [];
}

final class FeaturedCubitInitial extends FeaturedCubitState {}

final class FeaturedCubitSuccesState extends FeaturedCubitState {
  // we decide what will return if succes ? List of books
  final List<BookModel> books;
  const FeaturedCubitSuccesState({required this.books});
}

final class FeaturedCubitLoadingState extends FeaturedCubitState {}

final class FeaturedCubitFailureState extends FeaturedCubitState {
  final String errMessage;

  const FeaturedCubitFailureState({required this.errMessage});
}
