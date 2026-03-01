import 'package:flutter/material.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home View Mobile Layout',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
