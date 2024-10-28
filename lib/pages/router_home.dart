import 'package:flutter/material.dart';
import 'package:hw4/widgets/app_bar_home.dart';

class RouterHome extends StatelessWidget {
  const RouterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarHome(text: 'Home'),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
