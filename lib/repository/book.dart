import 'package:flutter_lorem/flutter_lorem.dart';

class Book {
  final int id;
  final String title;
  final String author;
  final String description;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
  });

  static Book createMockBook(int index) {
    return Book(
      id: index,
      title: Mock.title(),
      author: Mock.author(),
      description: Mock.description(),
    );
  }

  @override
  String toString() {
    return 'User(id: $id, title: $title, author: $author, description: $description) \n';
  }
}

class Mock {
  static String title() {
    return lorem(paragraphs: 1, words: 3)
        .replaceAll(".", "")
        .replaceAll(",", "");
  }

  static String author() {
    return lorem(paragraphs: 1, words: 2)
        .replaceAll(".", "")
        .replaceAll(",", "");
  }

  static String description() {
    return lorem(paragraphs: 1, words: 300);
  }
}

List<Book> bookList = List.generate(6, (index) => Book.createMockBook(index));
