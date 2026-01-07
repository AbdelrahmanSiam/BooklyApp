import 'package:bookly/constants.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService {
  final Box<BookModel> favoriteBox;

  HiveService({required this.favoriteBox});

  // 1- Add book to favorite
  Future<void> addToFavorite(BookModel bookModel) async{
    if (!favoriteBox.containsKey(bookModel.id)) {
      await favoriteBox.put(bookModel.id, bookModel);
    }
  }

  // 2- Delete book from favorite
  Future<void> deleteFromFavorite(String bookId) async {
   await favoriteBox.delete(bookId);
  }

  // 3- Display all favorite books
  List<BookModel> getAllFavoriteBooks() {
    return favoriteBox.values.toList(); // 
  }

  // 4- Is favorite Book ?

  bool isFavoriteBook(String bookId) {
    return favoriteBox.containsKey(bookId);
  }

  // 5- delete all favorite list
  Future<void> deleteAllFavoriteList() async{
    await favoriteBox.clear();
  }
}
