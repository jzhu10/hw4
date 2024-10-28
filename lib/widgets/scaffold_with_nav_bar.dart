import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/navigation/bookclub_router.dart';
import 'package:hw4/repository/book.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'By Author',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'By Title',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/byAuthor')) {
      return 0;
    }
    if (location.startsWith('/byTitle')) {
      return 1;
    }
    if (location.startsWith('/profile')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        bookList.sort((a, b) => a.author.compareTo(b.author));
        GoRouter.of(context).goNamed(RouteName.byAuthor);
      case 1:
        bookList.sort((a, b) => a.title.compareTo(b.title));
        GoRouter.of(context).goNamed(RouteName.byTitle);
      case 2:
        GoRouter.of(context).goNamed(RouteName.profile);
    }
  }
}
