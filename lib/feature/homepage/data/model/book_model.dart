class BookModel {
  final String id;
  final String title;
  final String author;
  final String imageUrl;

  BookModel({required this.id, required this.title, required this.author, required this.imageUrl});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'imageUrl': imageUrl,
      };
}
