import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final String icon;
  final VoidCallback onTap;

  const CustomIconButton({super.key, required this.icon, required this.onTap});

  @override
  State<CustomIconButton> createState() => CustomIconButtonState();
}

class CustomIconButtonState extends State<CustomIconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(4.0),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _hovered ? Color(0xffe07b39) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(widget.icon, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
