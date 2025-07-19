import 'package:flutter/material.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/1.now_playing.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/6.popular_movies_model.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/4.popular_tvseries_model.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/5.toprated_model.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/2.trening_movies.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/3.upcoming_movies.dart';
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
  final ScrollController _scrollController = ScrollController();

  final apiServices = ApiServices.instance;
  late Future<NowPlayingMovies?> nowplaying;
  late Future<UpcomingMovies?> upcomingMovies;
  late Future<TopRatedMovies?> topRatedMovies;
  late Future<TrendingMovies?> trendingMovies;
  late Future<PopularTvSeries?> popularTVseries;
  late Future<PopularMovies?> popularMovies;

  @override
  void initState() {
    nowplaying = apiServices.fetchNowplaying();
    upcomingMovies = apiServices.fetchupcommingMovie();
    topRatedMovies = apiServices.fetchTopRatedMovies();
    trendingMovies = apiServices.fetchTrendingMovies();
    popularTVseries = apiServices.fetchPopualrTvseries();
    popularMovies = apiServices.fetchpopularmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            CustomAppBar(),
            TitleBarWidget(
              onPressedbuttonOne: () {
                _scrollController.animateTo(
                  700,
                  duration: Duration(microseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              onPressedbuttonTwo: () {
                _scrollController.animateTo(
                  300,
                  duration: Duration(microseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              onPressedbuttonThree: () {},
            ),

            SizedBox(height: 10),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  PageViewCardWidget(movieData: nowplaying),
                  Positioned(
                    bottom: -40,
                    left: 14,
                    child: PageViewCardButtons(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            HorizondalListViewSection(
              movieData: trendingMovies,
              title: 'Trending Movies on Netflix',
            ),
            HorizondalListViewSection(
              movieData: upcomingMovies,
              title: 'Upcoming Movies',
            ),
            HorizondalListViewSection(
              movieData: popularTVseries,
              title: 'Popular TV Series -Most -Watch For You',
            ),
            HorizondalListViewSection(
              movieData: topRatedMovies,
              title: 'Top Rated Movies',
            ),
            HorizondalListViewSection(
              movieData: popularMovies,
              title: 'Popular Movies',
            ),
          ],
        ),
      ),
    );
  }
}
