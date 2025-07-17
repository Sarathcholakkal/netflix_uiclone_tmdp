import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:netflix_uiclone/models/nowplaying_model.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/upcomming_model.dart';

class MovieSection extends StatelessWidget {
  final Future<UpcommingMovies?> movieData;
  final String title;
  final bool isReverse;

  const MovieSection({
    super.key,
    required this.movieData,
    required this.title,
    this.isReverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),

          // Movie List
          SizedBox(
            height: 180,
            width: double.infinity,
            child: FutureBuilder<UpcommingMovies?>(
              future: movieData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final movies = snapshot.data!.results;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: isReverse,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  "$imageUrl${movie.posterPath}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No movies found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
