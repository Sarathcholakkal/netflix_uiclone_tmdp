import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/movie_modal.dart';

class PageViewCardWidget extends StatelessWidget {
  const PageViewCardWidget({super.key, required this.movieData});

  final Future<Movie?> movieData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: FutureBuilder(
        future: movieData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error:${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movies = snapshot.data!.results;
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: PageView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 530,
                      width: 388,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            "$imageUrl${movie.posterPath}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text('Problem to fecth data'));
          }
        },
      ),
    );
  }
}
