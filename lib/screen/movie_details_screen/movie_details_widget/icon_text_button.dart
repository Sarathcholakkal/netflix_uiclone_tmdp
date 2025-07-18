import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconsize;
  const IconTextButton({
    super.key,
    required this.title,
    required this.icon,
    required this.iconsize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: iconsize, color: Colors.white),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.white, height: 0.5),
        ),
      ],
    );
  }
}
