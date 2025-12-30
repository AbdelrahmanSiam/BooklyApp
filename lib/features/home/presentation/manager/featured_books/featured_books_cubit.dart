import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repoes/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedCubitInitial());

  final HomeRepo homeRepo;

  Future<void> getFeaturedBooksMethod() async {
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailureState(errMessage: failure.errorMessage));
    }, (books) {
      emit(FeaturedBooksSuccessState(books: books));
    });
  }
}
