import 'package:flutter/material.dart';
import 'package:hw4/repository/book.dart';

class BookDetails extends StatelessWidget {
  final int id;
  const BookDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Book book = bookList[id];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaddingText(
              text: book.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            PaddingText(
              text: book.author,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            PaddingText(
              text: book.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class PaddingText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const PaddingText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text, style: style),
    );
  }
}
