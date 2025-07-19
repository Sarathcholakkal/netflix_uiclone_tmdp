import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieNotFoundScreen extends StatefulWidget {
  const MovieNotFoundScreen({super.key});

  @override
  State<MovieNotFoundScreen> createState() => _MovieNotFoundScreenState();
}

class _MovieNotFoundScreenState extends State<MovieNotFoundScreen> {
  @override
  void initState() {
    super.initState();

    // Start the 3-second delay and show toast after it
    Future.delayed(Duration(seconds: 3), () {
      Fluttertoast.showToast(
        msg: "Movie details not available",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      // Automatically go back
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // This shows CircularProgressIndicator during the 3 seconds
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("Loading...", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
