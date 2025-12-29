import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repoes/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestCubitState> {
  NewestBooksCubit(this.homeRepo) : super(NewestCubitInitial());

  final HomeRepo homeRepo;
  Future<void> getNewestBooksMethod() async {
    emit(NewestCubitLoadingState());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestCubitFailureState(errMessage: failure.errorMessage));
    }, (newsetBooks) {
      emit(NewestCubitSuccessState(newestBooks: newsetBooks));
    });
  }
}
