import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/search_movie.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_detailed_screen.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.searchMovie});

  final SearchMovie? searchMovie;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: searchMovie?.results.length,
      itemBuilder: (context, Index) {
        final search = searchMovie!.results[Index];
        return search.backdropPath == null
            ? SizedBox()
            : Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailedScreen(movieId: search.id),
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
                              imageUrl: "$imageUrl${search.backdropPath}",
                              fit: BoxFit.contain,
                              height: 180,
                              placeholder: (context, url) => Container(
                                height: 90,
                                width: 160,
                                color: Colors.grey.shade800,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: Text(
                                search.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
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
                  Positioned(
                    top: 35,
                    left: 70,
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
  }
}
