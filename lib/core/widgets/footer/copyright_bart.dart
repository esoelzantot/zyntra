import 'package:flutter/material.dart';
import 'package:zyntra/core/functions/launch_url.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class CopyrightBar extends StatelessWidget {
  const CopyrightBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2026 Zyntra Biology Space. All rights reserved. ',
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium18(
              context,
            ).copyWith(color: Colors.grey.shade500),
          ),
          // const SizedBox(height: 8),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                'Developed by',
                textAlign: TextAlign.center,
                style: AppStyles.styleMedium18(context),
              ),
              TextButton(
                onPressed: () => launchUrlFunc('https://www.axuraa.com'),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Row(
                  children: [
                    Text(
                      'A',
                      style: AppStyles.styleBold24(
                        context,
                      ).copyWith(color: Color(0xffE07B39)),
                    ),
                    Text('X', style: AppStyles.styleBold24(context)),
                    Text(
                      'URAA',
                      style: AppStyles.styleBold24(
                        context,
                      ).copyWith(color: Color(0xffE07B39)),
                    ),
                  ],
                ),
              ),
              Text(
                '.Powered by Flutter.',
                textAlign: TextAlign.center,
                style: AppStyles.styleMedium18(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
