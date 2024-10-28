import 'package:flutter/material.dart';
import 'package:hw4/navigation/bookclub_router.dart';
import 'package:hw4/widgets/app_bar_home.dart';
import 'package:hw4/widgets/booklist.dart';

class RouterByTitle extends StatelessWidget {
  const RouterByTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarHome(text: 'Books'),
      backgroundColor: Colors.white,
      body: Booklist(title: 'Sorted by Title', route: RouteName.byTitleDetail),
    );
  }
}
