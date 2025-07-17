import 'package:flutter/material.dart';
import 'package:netflix_uiclone/models/nowplaying_model.dart';
import 'package:netflix_uiclone/models/upcomming_model.dart';
import 'package:netflix_uiclone/screen/home_screen/home_widgets/custom_appbar.dart';
import 'package:netflix_uiclone/screen/home_screen/home_widgets/listview_widget.dart';
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
  late Future<UpcommingMovies?> upcomingMovies;
  @override
  void initState() {
    movieData = apiServices.fetchMovies();
    upcomingMovies = apiServices.fetchupcommingMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
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
                  Positioned(
                    bottom: -40,
                    left: 14,
                    child: PageViewCardButtons(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            MovieSection(movieData: upcomingMovies, title: 'Upcoming Movies'),
          ],
        ),
      ),
    );
  }
}
