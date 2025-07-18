import 'package:flutter/material.dart';
import 'package:netflix_uiclone/models/movie_details_model.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/movie_details_widget/icon_text_button.dart';

class MovieDescriptionWidget extends StatelessWidget {
  const MovieDescriptionWidget({
    super.key,
    required this.genresText,
    required this.movie,
  });

  final String? genresText;
  final MovieDetails? movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          genresText ?? "",
          style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
        ),
        Text(
          movie?.overview ?? "",
          maxLines: 5,
          overflow: TextOverflow.ellipsis,

          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconTextButton(
              title: 'My List',
              icon: Icons.add_outlined,
              iconsize: 45,
            ),
            IconTextButton(
              title: 'Rate',
              icon: Icons.thumb_up_outlined,
              iconsize: 40,
            ),
            IconTextButton(
              title: 'Share',
              icon: Icons.share_outlined,
              iconsize: 40,
            ),
          ],
        ),
      ],
    );
  }
}
