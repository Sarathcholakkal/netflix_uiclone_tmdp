import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_uiclone/screen/home_screen/netiflix_home_screen.dart';
import 'package:netflix_uiclone/screen/hot_news_screen/hot_news_screen.dart';
import 'package:netflix_uiclone/screen/search_sreen/seach_screen.dart';

class AppNavbarScreen extends StatelessWidget {
  const AppNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Iconsax.home5), text: 'Home'),
              Tab(icon: Icon(Iconsax.search_normal), text: 'Search'),
              Tab(icon: Icon(Icons.photo_library_outlined), text: 'Hot News'),
            ],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
        ),
        body: TabBarView(
          children: [NetiflixHomeScreen(), SearchScreen(), HotNewsScreen()],
        ),
      ),
    );
  }
}
