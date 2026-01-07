import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/favorite/data/repo/favorite_books_repo_implementation.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteBooksRepoImplementation)
      : super(FavoriteInitialState());

  final FavoriteBooksRepoImplementation favoriteBooksRepoImplementation;

  void fetchAllListOfFavoriteBooks() {
    try {
      emit(FavoriteLoadingState());
      List<BookModel> favoriteBooks =
          favoriteBooksRepoImplementation.fetchAllFavoriteBooks();
      emit(FavoriteSuccessState(favoriteBooks: favoriteBooks));
    } catch (e) {
      emit(FavoriteFailureState(errMessage: e.toString()));
    }
  }

  Future<void> toggleFav(BookModel bookModel) async {
    await favoriteBooksRepoImplementation.toggleFavorite(bookModel);
    fetchAllListOfFavoriteBooks();
  }

  bool isFav(String bookId) {
    return favoriteBooksRepoImplementation.isFavoriteBook(bookId);
    
  }

  Future<void> clearAllFavBooks() async {
    await favoriteBooksRepoImplementation.clearAllFavoriteBooks();
    fetchAllListOfFavoriteBooks();
  }
}
