import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  Future<void> getSearchedBooks({required String bookName}) async {
    emit(SearchLoadingState());
    var result = await searchRepo.fetchSearchedBooks(bookName: bookName);

    result.fold((failure) {
      emit(SearchFailureState(errMessage: failure.errorMessage));
    }, (searchBooks) {
      emit(SearchSuccessState(searchBooks: searchBooks));
    });
  }
}
