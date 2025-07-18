import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/movie_details_model.dart';
import 'package:netflix_uiclone/models/movie_recommadation_model.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_details_widget/movie_description_widget.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_details_widget/movie_details_poster.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_details_widget/movie_details_title.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_details_widget/wideelevated_button.dart';
import 'package:netflix_uiclone/services/api_services.dart';

class MovieDetailedScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailedScreen({super.key, required this.movieId});

  @override
  State<MovieDetailedScreen> createState() => _MovieDetailedScreenState();
}

class _MovieDetailedScreenState extends State<MovieDetailedScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<MovieDetails?> movieDetail;
  late Future<MovieRecommedations?> movieRecommendation;
  @override
  void initState() {
    fetchMovieData();
    super.initState();
  }

  fetchMovieData() {
    movieDetail = apiServices.fetchMovieDetails(widget.movieId);
    movieRecommendation = apiServices.fetchMovieRecommedation(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data;
              final genresText = movie?.genres.map((e) => e.name).join(' ,');

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailsPoster(size: size, movie: movie),
                  MovieDetailsTitle(movie: movie),
                  WideElevatedButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    icon: Icons.play_arrow,
                    title: 'Play',
                  ),

                  SizedBox(height: 10),
                  WideElevatedButton(
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white,
                    icon: Icons.download,
                    title: 'Download',
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    child: MovieDescriptionWidget(
                      genresText: genresText,
                      movie: movie,
                    ),
                  ),
                  SizedBox(height: 20),
                  FutureBuilder(
                    future: movieRecommendation,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final movie = snapshot.data;
                        return movie!.results.isEmpty
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'More Like This',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemCount: movie.results.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            right: 2,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "$imageUrl${movie.results[index].posterPath}",
                                            height: 200,
                                            width: 150,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                      }
                      return Text("nothing to show");
                    },
                  ),
                ],
              );
            }

            return SafeArea(
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Something went wrong, back to home',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
