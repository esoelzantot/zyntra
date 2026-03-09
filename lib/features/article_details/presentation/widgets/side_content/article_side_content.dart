import 'package:flutter/material.dart';

class ArticleSideContent extends StatelessWidget {
  const ArticleSideContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.grey[300],
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Side content such as related articles, author information, and advertisements goes here.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
