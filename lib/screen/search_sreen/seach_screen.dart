import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/search_movie.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_detailed_screen.dart';
import 'package:netflix_uiclone/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiServices apiServices = ApiServices();
  TextEditingController searchController = TextEditingController();
  SearchMovie? searchMovie;
  void search(String query) {
    apiServices.fetchseachedmovie(query).then((result) {
      setState(() {
        searchMovie = result;
      });
    });
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
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              padding: EdgeInsets.all(10),
              prefixIcon: Icon(CupertinoIcons.search, color: Colors.white),
              suffixIcon: Icon(Icons.cancel, color: Colors.white),
              style: TextStyle(color: Colors.black),
              backgroundColor: Colors.grey.withAlpha(60),
              onChanged: (value) {
                if (value.isEmpty) {
                } else {
                  search(searchController.text);
                }
              },
            ),
            searchController.text.isEmpty
                ? SizedBox()
                : searchMovie == null
                ? SizedBox.shrink()
                : ListView.builder(
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
                                              MovieDetailedScreen(
                                                movieId: search.id,
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
                                                "$imageUrl${search.backdropPath}",
                                            fit: BoxFit.contain,
                                            height: 180,
                                          ),
                                          SizedBox(width: 20),
                                          Flexible(
                                            child: Text(
                                              search.title,
                                              maxLines: 1,
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
                  ),
          ],
        ),
      ),
    );
  }
}
