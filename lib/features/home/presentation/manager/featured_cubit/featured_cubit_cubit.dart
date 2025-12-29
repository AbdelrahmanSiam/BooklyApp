import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repoes/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_cubit_state.dart';

class FeaturedCubitCubit extends Cubit<FeaturedCubitState> {
  FeaturedCubitCubit(this.homeRepo) : super(FeaturedCubitInitial());

  final HomeRepo homeRepo;

  Future<void> getFeaturedBooksMethod() async {
    emit(FeaturedCubitLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedCubitFailureState(errMessage: failure.errorMessage));
    }, (books) {
      emit(FeaturedCubitSuccessState(books: books));
    });
  }
}
