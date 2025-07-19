import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/screen/hot_news_screen/hotnews_model/hot_news_model.dart';

class MovieInfoSection extends StatelessWidget {
  final Result movie;
  final String dayText;
  final String monthText;

  const MovieInfoSection({
    required this.movie,
    required this.dayText,
    required this.monthText,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return Expanded(
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
          const SizedBox(height: 5),
          Row(
            children: [
              const Text("Coming on", style: textStyle),
              const SizedBox(width: 5),
              Text(dayText, style: textStyle),
              const SizedBox(width: 5),
              Text(monthText, style: textStyle),
              const Spacer(),
              const Icon(Icons.notifications, color: Colors.white, size: 25),
              const SizedBox(width: 10),
              const Icon(Icons.info_outline, color: Colors.white, size: 25),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            movie.overview,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
