import 'package:bookly/core/models/book_model/book_model.dart';

abstract class FavoriteBooksRepo {
  // 1- Add and remove book form favorite
  Future<void> toggleFavorite(BookModel bookModel);
  // 2- fetch all favorite books
  List<BookModel> fetchAllFavoriteBooks();
  //3- Clear all favorite books
  Future<void> clearAllFavoriteBooks();
  // 4- is Favorite book ?
  void isFavoriteBook(String bookId);
}
