import 'package:flutter/material.dart';

class AppBarDetail extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppBarDetail({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.account_circle_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
