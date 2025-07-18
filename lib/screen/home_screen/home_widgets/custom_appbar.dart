import 'package:flutter/material.dart';
import 'package:netflix_uiclone/screen/search_sreen/seach_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Image.asset("assets/log.png", height: 50),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            icon: Icon(Icons.search, size: 27, color: Colors.white),
          ),
          Icon(Icons.download_sharp, size: 27, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.cast, size: 27, color: Colors.white),
        ],
      ),
    );
  }
}
