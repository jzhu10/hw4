import 'package:flutter/material.dart';
import 'package:hw4/widgets/app_bar_detail.dart';
import 'package:hw4/widgets/book_details.dart';

class RouterByTitleDetail extends StatelessWidget {
  final int index;
  const RouterByTitleDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDetail(text: 'By Title Detail'),
      backgroundColor: Colors.white,
      body: BookDetails(id: index),
    );
  }
}
