import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/movie_details_model.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_details_widget/movie_details_poster.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_details_widget/movie_details_title.dart';
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
  @override
  void initState() {
    fetchMovieData();
    super.initState();
  }

  fetchMovieData() {
    movieDetail = apiServices.fetchMovieDetails(widget.movieId);
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
                  SizedBox(height: 15),
                  Text(
                    genresText ?? "Nothing to dispaly",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  SizedBox(height: 10),
                  Text(
                    movie?.overview ?? "",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              );
            }

            return Text('something went wrong');
          },
        ),
      ),
    );
  }
}

class WideElevatedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final String title;
  const WideElevatedButton({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: foregroundColor),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
