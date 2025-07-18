import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/movie_details_model.dart';

class MovieDetailsPoster extends StatelessWidget {
  const MovieDetailsPoster({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final MovieDetails? movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                "$imageUrl${movie?.posterPath}",
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 50,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black54,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
              SizedBox(width: 8),
              CircleAvatar(
                backgroundColor: Colors.black54,
                child: Icon(Icons.cast, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          top: 100,
          bottom: 100,
          right: 100,
          left: 100,
          child: Icon(Icons.play_circle_outline, size: 50, color: Colors.white),
        ),
      ],
    );
  }
}
