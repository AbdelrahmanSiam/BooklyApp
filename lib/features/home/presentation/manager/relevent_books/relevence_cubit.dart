import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repoes/home_repo.dart';
import 'package:bookly/features/home/data/repoes/home_repo_implementation.dart';
import 'package:equatable/equatable.dart';

part 'relevence_state.dart';

class RelevenceCubit extends Cubit<RelevenceState> {
  final HomeRepo homeRepo;
  RelevenceCubit(this.homeRepo) : super(RelevenceInitial());

  Future<void> getRelevenceBooksMethod({required String category}) async {
    emit(RelevenceLoadingState());
    var result = await homeRepo.fetchRelevenceBooks(category: category);
    result.fold((failure) {
      emit(RelevenceFailureState(errMessage: failure.errorMessage));
    }, (relevenceBooks) {
      emit(RelevenceSuccessState(books: relevenceBooks));
    },);
  }
}
