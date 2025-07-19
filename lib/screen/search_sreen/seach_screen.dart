import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/screen/search_sreen/search_model/search_movie.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/2.trening_movies.dart';
import 'package:netflix_uiclone/screen/search_sreen/search_widget/default_result.dart';
import 'package:netflix_uiclone/screen/search_sreen/search_widget/search_result_widget.dart';
import 'package:netflix_uiclone/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // ApiServices apiServices = ApiServices();
  final apiServices = ApiServices.instance;
  TextEditingController searchController = TextEditingController();
  late Future<TrendingMovies?> trendingonNetflix;
  SearchMovie? searchMovie;
  void search(String query) {
    apiServices.fetchseachedmovie(query).then((result) {
      setState(() {
        searchMovie = result;
      });
    });
  }

  @override
  void initState() {
    trendingonNetflix = apiServices.fetchTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              padding: EdgeInsets.all(10),
              prefixIcon: Icon(CupertinoIcons.search, color: Colors.white),
              suffixIcon: Icon(Icons.cancel, color: Colors.white),
              style: TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withAlpha(60),
              onChanged: (value) {
                if (value.isEmpty) {
                } else {
                  search(searchController.text);
                }
              },
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 5),
              child: Text(
                "Top Search",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),

            searchController.text.isEmpty
                ? DefaultResult(trendingMovie: trendingonNetflix)
                : searchMovie == null
                ? SizedBox.shrink()
                : SearchResultWidget(searchMovie: searchMovie),
          ],
        ),
      ),
    );
  }
}
