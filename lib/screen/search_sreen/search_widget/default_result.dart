import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/trending_model.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_detailed_screen.dart';

class DefaultResult extends StatelessWidget {
  const DefaultResult({super.key, required this.trendingMovie});

  final Future<TrendingMovies?> trendingMovie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TrendingMovies?>(
      future: trendingMovie,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        } else if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.results.isEmpty) {
          return const Center(child: Text('No results found'));
        }

        final movies = snapshot.data!.results;

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final defaultResult = movies[index];
            return defaultResult.backdropPath == null
                ? const SizedBox()
                : Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MovieDetailedScreen(
                                  movieId: defaultResult.id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      "$imageUrl${defaultResult.backdropPath}",
                                  fit: BoxFit.contain,
                                  height: 180,
                                ),
                                const SizedBox(width: 20),
                                Flexible(
                                  child: Text(
                                    defaultResult.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 35,
                        left: 72,
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                    ],
                  );
          },
        );
      },
    );
  }
}
