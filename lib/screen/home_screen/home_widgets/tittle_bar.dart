import 'package:flutter/material.dart';
import 'package:netflix_uiclone/screen/home_screen/home_widgets/tabbar_button.dart';

class TitleBarWidget extends StatelessWidget {
  final Function() onPressedbuttonOne;
  final Function() onPressedbuttonTwo;
  final Function() onPressedbuttonThree;

  const TitleBarWidget({
    super.key,
    required this.onPressedbuttonOne,
    required this.onPressedbuttonTwo,
    required this.onPressedbuttonThree,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        spacing: 10,
        children: [
          TapBarButton(title: "T V shows", onPressed: onPressedbuttonOne),
          TapBarButton(title: "Movies", onPressed: onPressedbuttonTwo),
          TapBarButton(
            title: "Categories",
            onPressed: onPressedbuttonThree,
            isArrowDown: true,
          ),
        ],
      ),
    );
  }
}
