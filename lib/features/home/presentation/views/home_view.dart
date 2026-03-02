import 'package:flutter/material.dart';
import 'package:zyntra/core/layouts/adaptive_layout.dart';
import 'package:zyntra/features/home/presentation/widgets/layouts/home_view_mobile_layout.dart';
import 'package:zyntra/features/home/presentation/widgets/layouts/home_view_tablet_layout.dart';
import 'package:zyntra/features/home/presentation/widgets/layouts/home_view_web_layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => HomeViewMobileLayout(),
        tabletLayout: (context) => HomeViewTabletLayout(),
        desktopLayout: (context) => HomeViewWebLayout(),
      ),
    );
  }
}
