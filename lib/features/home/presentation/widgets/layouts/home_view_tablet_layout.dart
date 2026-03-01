import 'package:flutter/material.dart';

class HomeViewTabletLayout extends StatelessWidget {
  const HomeViewTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home View Tablet Layout',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
