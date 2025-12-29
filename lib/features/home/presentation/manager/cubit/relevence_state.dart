part of 'relevence_cubit.dart';

sealed class RelevenceState extends Equatable {
  const RelevenceState();

  @override
  List<Object> get props => [];
}

final class RelevenceInitial extends RelevenceState {}

final class RelevenceSuccessState extends RelevenceState {
  final List<BookModel> books;

  const RelevenceSuccessState({required this.books});
}

final class RelevenceLoadingState extends RelevenceState {}

final class RelevenceFailureState extends RelevenceState {
  final String errMessage;

  const RelevenceFailureState({required this.errMessage});
}
