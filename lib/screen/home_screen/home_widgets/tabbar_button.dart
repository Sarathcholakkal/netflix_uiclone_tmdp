import 'package:flutter/material.dart';

class TapBarButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  bool isArrowDown;
  TapBarButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isArrowDown = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.white38),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          isArrowDown
              ? Icon(Icons.keyboard_arrow_down, color: Colors.white)
              : SizedBox(),
        ],
      ),
    );
  }
}
