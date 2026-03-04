import 'package:flutter/material.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/widgets/buttons/custom_elevated_button.dart';
import 'package:zyntra/core/widgets/buttons/custom_outlined_button.dart';

class HeroCallActions extends StatefulWidget {
  const HeroCallActions({super.key});

  @override
  State<HeroCallActions> createState() => _HeroCallActionsState();
}

class _HeroCallActionsState extends State<HeroCallActions> {
  late double width;
  late bool isMobile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.of(context).size.width;
    isMobile = width < SizeConfig.tablet;
  }

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Launch Research Portal button
              CustomElevatedButton(
                onPress: () {},
                title: "Browse Archive",
                backgroundColor: AppColors.primaryColor,
              ),

              const SizedBox(height: 16),

              // View Lab Specs button
              CustomOutlinedButton(onPress: () {}, title: "Try Asky AI"),
            ],
          )
        : Row(
            children: [
              // Launch Research Portal button
              CustomElevatedButton(
                onPress: () {},
                title: "Browse Archive",
                backgroundColor: AppColors.primaryColor,
              ),

              const SizedBox(width: 16),

              // View Lab Specs button
              CustomOutlinedButton(onPress: () {}, title: "Try Asky AI"),
            ],
          );
  }
}
