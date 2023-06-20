import 'package:flutter/material.dart';
import 'package:flutter_xv/demo/navigator/book_entity.dart';

class BooksListScreen extends StatelessWidget {

  const BooksListScreen({
    super.key,
    required this.books,
    required this.onTapped,
  });

  final List<Book> books;
  final ValueChanged<Book> onTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}
