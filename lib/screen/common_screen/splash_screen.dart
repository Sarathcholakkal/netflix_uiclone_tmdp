import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_uiclone/screen/common_screen/app_navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AppNavbarScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/logo_animation.json"));
  }
}
