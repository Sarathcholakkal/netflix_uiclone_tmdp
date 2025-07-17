import 'package:flutter/material.dart';
import 'package:netflix_uiclone/models/movie_modal.dart';
import 'package:netflix_uiclone/screen/home_screen/home_widgets/pageview_card.dart';
import 'package:netflix_uiclone/screen/home_screen/home_widgets/pageview_card_buttons.dart';
import 'package:netflix_uiclone/screen/home_screen/home_widgets/tittle_bar.dart';
import 'package:netflix_uiclone/services/api_services.dart';

class NetiflixHomeScreen extends StatefulWidget {
  const NetiflixHomeScreen({super.key});

  @override
  State<NetiflixHomeScreen> createState() => _NetiflixHomeScreenState();
}

class _NetiflixHomeScreenState extends State<NetiflixHomeScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<Movie?> movieData;
  @override
  void initState() {
    movieData = apiServices.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          CustomAppBar(),
          TitleBarWidget(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                PageViewCardWidget(movieData: movieData),
                Positioned(bottom: -40, left: 14, child: PageViewCardButtons()),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

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
            onPressed: () {},
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
