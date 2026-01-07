import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/storage/hive_service.dart';
import 'package:bookly/features/favorite/data/repo/favorite_books_repo.dart';

class FavoriteBooksRepoImplementation implements FavoriteBooksRepo {
  final HiveService hiveService;

  FavoriteBooksRepoImplementation({required this.hiveService});

  @override
  Future<void> clearAllFavoriteBooks() async {
    await hiveService.deleteAllFavoriteList();
  }

  @override
  List<BookModel> fetchAllFavoriteBooks() {
    return hiveService.getAllFavoriteBooks();
  }

  @override
  bool isFavoriteBook(String bookId) {
    return hiveService.isFavoriteBook(bookId);
  }

  @override
  Future<void> toggleFavorite(BookModel bookModel) async{
    if (hiveService.isFavoriteBook(bookModel.id)) {
      await hiveService.deleteFromFavorite(bookModel.id);
    } else {
      await hiveService.addToFavorite(bookModel);
    }
  }
}
