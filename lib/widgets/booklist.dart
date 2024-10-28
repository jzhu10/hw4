import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/repository/book.dart';

class Booklist extends StatelessWidget {
  final String route;
  final String title;
  const Booklist({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Booklist with title
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.headlineMedium),

            // Booklist
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bookList.length,
                itemBuilder: (BuildContext context, int index) {
                  Book book = bookList[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 20 : 10,
                    ),

                    // Booklist item
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).goNamed(
                          route,
                          pathParameters: {'index': index.toString()},
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 28, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(book.title,
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 4),
                              Text(
                                book.author,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
