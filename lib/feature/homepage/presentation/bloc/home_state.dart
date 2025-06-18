import 'package:book_store/feature/homepage/domain/entity/book_entity.dart';

// class BookState {
//   final List<Book> books;
//   final String searchQuery;
//   BookState({required this.books, this.searchQuery = ''});

//   List<Book> get filteredBooks => books.where((b) => b.title.toLowerCase().contains(searchQuery.toLowerCase())).toList();
//   List<Book> get favorites => books.where((b) => b.isFavorite).toList();
// }

sealed class BookState {}

final class InitialBookState extends BookState {}

class FailureState extends BookState {}

class LoadingState extends BookState {
  final bool isLoading;
  LoadingState({required this.isLoading});
}

class GetBooksSuccessState extends BookState {
  List<Book>? books;
  GetBooksSuccessState({this.books});
}

class GetFavBooksState extends BookState {
  List<Book>? books;
  GetFavBooksState({this.books});
}
