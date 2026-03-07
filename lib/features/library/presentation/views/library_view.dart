import 'package:flutter/material.dart';
import 'package:zyntra/core/layouts/adaptive_layout.dart';
import 'package:zyntra/features/library/presentation/widgets/layouts/library_view_mobile_layout.dart';
import 'package:zyntra/features/library/presentation/widgets/layouts/library_view_tablet_layout.dart';
import 'package:zyntra/features/library/presentation/widgets/layouts/library_view_web_layout.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => LibraryViewMobileLayout(),
        tabletLayout: (context) => LibraryViewTabletLayout(),
        desktopLayout: (context) => LibraryViewWebLayout(),
      ),
    );
  }
}
