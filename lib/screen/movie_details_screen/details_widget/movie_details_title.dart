import 'package:flutter/material.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/details_model/movie_details_model.dart';

class MovieDetailsTitle extends StatelessWidget {
  const MovieDetailsTitle({super.key, required this.movie});

  final MovieDetails? movie;

  @override
  Widget build(BuildContext context) {
    String formatRuntime(int runtime) {
      int hours = runtime ~/ 60;
      int minutes = runtime % 60;
      return '${hours}h ${minutes}m';
    }

    return Padding(
      padding: EdgeInsets.only(top: 25, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                movie!.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Image.asset("assets/netflix_tittle.png", height: 40),
            ],
          ),
          Row(
            children: [
              Text(
                movie!.releaseDate.year.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text(
                formatRuntime(movie!.runtime),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "HD",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
