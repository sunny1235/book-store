abstract class BookEvent {}

class LoadBooks extends BookEvent {
  final String? query;
  LoadBooks({this.query = ''});
}

class ToggleFavorite extends BookEvent {
  final String bookId;
  ToggleFavorite(this.bookId);
}

class GetFavBooksEvent extends BookEvent {}
