import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_uiclone/screen/hot_news_screen/hotnews_model/hot_news_model.dart';
import 'package:netflix_uiclone/screen/hot_news_screen/hot_news_widget/date_section.dart';
import 'package:netflix_uiclone/screen/hot_news_screen/hot_news_widget/movie_info_section.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_detailed_screen.dart';

class HotNewsItem extends StatelessWidget {
  final Result movie;

  const HotNewsItem({super.key, required this.movie});

  String getShorName(String name) {
    return name.length > 3 ? name.substring(0, 3) : name;
  }

  String formatDate(String date) {
    DateTime updatedDate = DateTime.parse(date);
    return DateFormat('MMM').format(updatedDate);
  }

  @override
  Widget build(BuildContext context) {
    final firstAirDate = movie.firstAirDate?.day.toString() ?? "";
    final releaseDay = movie.releaseDate?.day.toString() ?? "";

    final dayText = movie.releaseDate == null ? firstAirDate : releaseDay;
    final monthText = movie.releaseDate == null
        ? getShorName(formatDate(movie.firstAirDate?.toString() ?? ""))
        : getShorName(formatDate(movie.releaseDate?.toString() ?? ""));

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailedScreen(movieId: movie.id),
            ),
          );
        },
        child: Row(
          children: [
            DateSection(dayText: dayText, monthText: monthText),
            MovieInfoSection(
              movie: movie,
              dayText: dayText,
              monthText: monthText,
            ),
          ],
        ),
      ),
    );
  }
}
