import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/hot_news_model.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_detailed_screen.dart';
import 'package:netflix_uiclone/services/api_services.dart';
import 'package:intl/intl.dart';

class HotNewsScreen extends StatefulWidget {
  const HotNewsScreen({super.key});

  @override
  State<HotNewsScreen> createState() => _HotNewsScreenState();
}

class _HotNewsScreenState extends State<HotNewsScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<HotNews?> hotnews;
  void initState() {
    hotnews = apiServices.fetchHotNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String getShorName(String name) {
      return name.length > 3 ? name.substring(0, 3) : name;
    }

    String formatDate(String date) {
      DateTime updatedDate = DateTime.parse(date);
      return DateFormat('MMM').format(updatedDate);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Hot News'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: hotnews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error:${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movies = snapshot.data!.results;
            return ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final movie = movies[index];
                String first_air_date =
                    movie.firstAirDate?.day.toString() ?? "";
                String releaseDay = movie.releaseDate?.day.toString() ?? "";
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailedScreen(movieId: movie.id),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Container(color: Colors.green),
                              Text(
                                movie.releaseDate == null
                                    ? first_air_date
                                    : releaseDay,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                movie.releaseDate == null
                                    ? getShorName(
                                        formatDate(
                                          movie.firstAirDate?.toString() ?? "",
                                        ),
                                      )
                                    : getShorName(
                                        formatDate(
                                          movie.releaseDate?.toString() ?? "",
                                        ),
                                      ),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      "$imageUrl${movie.backdropPath}",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "Coming on",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    movie.releaseDate == null
                                        ? first_air_date
                                        : releaseDay,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    movie.releaseDate == null
                                        ? getShorName(
                                            formatDate(
                                              movie.firstAirDate?.toString() ??
                                                  "",
                                            ),
                                          )
                                        : getShorName(
                                            formatDate(
                                              movie.releaseDate?.toString() ??
                                                  "",
                                            ),
                                          ),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                movie.overview,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Problem to fecth data'));
          }
        },
      ),
    );
  }
}
