class Book {
  final String title;
  final String author;

  Book({required this.title, required this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];
    return Book(
      title: volumeInfo['title'] ?? 'Unknown Title',
      author: (volumeInfo['authors'] as List<dynamic>?)?.join(", ") ??
          'Unknown Author',
    );
  }
}
