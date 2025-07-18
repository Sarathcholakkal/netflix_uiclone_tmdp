import 'package:flutter/material.dart';
import 'package:netflix_uiclone/screen/home_screen/home_widgets/tabbar_button.dart';

class TitleBarWidget extends StatelessWidget {
  const TitleBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        spacing: 10,
        children: [
          TapBarButton(title: "T V shows", onPressed: () {}),
          TapBarButton(title: "Movies", onPressed: () {}),
          TapBarButton(
            title: "Categories",
            onPressed: () {},
            isArrowDown: true,
          ),
        ],
      ),
    );
  }
}
