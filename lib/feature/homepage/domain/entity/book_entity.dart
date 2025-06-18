class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Book copyWith({bool? isFavorite}) {
    return Book(
      id: id,
      title: title,
      author: author,
      imageUrl: imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}