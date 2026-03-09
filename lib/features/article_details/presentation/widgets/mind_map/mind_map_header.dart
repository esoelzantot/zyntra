import 'package:flutter/material.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/article_details/presentation/widgets/mind_map/map_control_button.dart';

class MindMapHeader extends StatefulWidget {
  final VoidCallback zoomIn;
  final VoidCallback zoomOut;

  final VoidCallback fullScreen;

  const MindMapHeader({
    super.key,
    required this.zoomIn,
    required this.zoomOut,
    required this.fullScreen,
  });

  @override
  _MindMapHeaderState createState() => _MindMapHeaderState();
}

class _MindMapHeaderState extends State<MindMapHeader> {
  late double width;
  late bool isMobile;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      width = MediaQuery.sizeOf(context).width;
      isMobile = (width <= SizeConfig.tablet) ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Text(
                          'Interactive Research Map',
                          style: AppStyles.styleBold30(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Visualize connections between research nodes',
                    style: AppStyles.styleMedium16(
                      context,
                    ).copyWith(color: Color(0xFF6B7A99)),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MapControlButton(
                    icon: Icons.zoom_in_rounded,
                    onTap: widget.zoomIn,
                  ),
                  const SizedBox(width: 8),
                  MapControlButton(
                    icon: Icons.zoom_out_rounded,
                    onTap: widget.zoomOut,
                  ),
                  const SizedBox(width: 8),
                  MapControlButton(
                    icon: Icons.fullscreen_rounded,
                    onTap: widget.fullScreen,
                  ),
                ],
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Text(
                          'Interactive Research Map',
                          style: AppStyles.styleBold30(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Visualize connections between research nodes',
                      style: AppStyles.styleMedium16(
                        context,
                      ).copyWith(color: Color(0xFF6B7A99)),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  MapControlButton(
                    icon: Icons.zoom_in_rounded,
                    onTap: widget.zoomIn,
                  ),
                  const SizedBox(width: 8),
                  MapControlButton(
                    icon: Icons.zoom_out_rounded,
                    onTap: widget.zoomOut,
                  ),
                  const SizedBox(width: 8),
                  MapControlButton(
                    icon: Icons.fullscreen_rounded,
                    onTap: widget.fullScreen,
                  ),
                ],
              ),
            ],
          );
  }
}
