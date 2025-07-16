import 'package:flutter/material.dart';

class NetiflixHomeScreen extends StatefulWidget {
  const NetiflixHomeScreen({super.key});

  @override
  State<NetiflixHomeScreen> createState() => _NetiflixHomeScreenState();
}

class _NetiflixHomeScreenState extends State<NetiflixHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset("assets/log.png", height: 50),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 27, color: Colors.white),
                ),
                Icon(Icons.download_sharp, size: 27, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.cast, size: 27, color: Colors.white),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              spacing: 10,
              children: [
                TabarButton(tittle: "T V shows", onPressed: () {}),
                TabarButton(tittle: "Movies", onPressed: () {}),
                TabarButton(
                  tittle: "Categories",
                  onPressed: () {},
                  isArrowDown: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabarButton extends StatelessWidget {
  final Function() onPressed;
  final String tittle;
  bool isArrowDown;
  TabarButton({
    super.key,
    required this.onPressed,
    required this.tittle,
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
            tittle,
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
