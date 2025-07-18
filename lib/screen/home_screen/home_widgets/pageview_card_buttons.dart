import 'package:flutter/material.dart';
import 'package:netflix_uiclone/screen/home_screen/home_widgets/home_button.dart';

class PageViewCardButtons extends StatelessWidget {
  const PageViewCardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeButton(
            backgroudcolor: Colors.white,
            icon: Icons.play_arrow,
            tittle: 'Play',
            foregroundcolor: Colors.black,
          ),
          HomeButton(
            backgroudcolor: Colors.grey.shade800,
            icon: Icons.add,
            tittle: 'My List',
            foregroundcolor: Colors.white,
          ),
        ],
      ),
    );
  }
}
