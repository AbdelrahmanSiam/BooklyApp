part of 'newest_cubit_cubit.dart';

sealed class NewestCubitState extends Equatable {
  const NewestCubitState();

  @override
  List<Object> get props => [];
}

final class NewestCubitInitial extends NewestCubitState {}

final class NewestCubitSuccessState extends NewestCubitState {
  final List<BookModel> newestBooks;
  const NewestCubitSuccessState({required this.newestBooks});
}

final class NewestCubitLoadingState extends NewestCubitState {}

final class NewestCubitFailureState extends NewestCubitState {
  final String errMessage;

  const NewestCubitFailureState({required this.errMessage});
}
