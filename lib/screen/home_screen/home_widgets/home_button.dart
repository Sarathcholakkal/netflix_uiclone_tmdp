import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final Color backgroudcolor;
  final IconData icon;
  final String tittle;
  final Color foregroundcolor;
  const HomeButton({
    super.key,
    required this.backgroudcolor,
    required this.icon,
    required this.tittle,
    required this.foregroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: backgroudcolor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        spacing: 2,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: foregroundcolor, size: 30),

          Text(
            tittle,
            style: TextStyle(
              color: foregroundcolor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
