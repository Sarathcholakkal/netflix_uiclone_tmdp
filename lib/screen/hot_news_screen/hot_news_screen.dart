import 'package:flutter/material.dart';
import 'package:netflix_uiclone/models/hot_news_model.dart';
import 'package:netflix_uiclone/screen/hot_news_screen/hot_news_widget/hot_news_item.dart';
import 'package:netflix_uiclone/services/api_services.dart';

class HotNewsScreen extends StatefulWidget {
  const HotNewsScreen({super.key});

  @override
  State<HotNewsScreen> createState() => _HotNewsScreenState();
}

class _HotNewsScreenState extends State<HotNewsScreen> {
  // final ApiServices apiServices = ApiServices();
  final apiServices = ApiServices.instance;
  late Future<HotNews?> hotnews;

  @override
  void initState() {
    hotnews = apiServices.fetchHotNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Hot News'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<HotNews?>(
        future: hotnews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movies = snapshot.data!.results;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return HotNewsItem(movie: movie);
              },
            );
          } else {
            return const Center(child: Text('Problem to fetch data'));
          }
        },
      ),
    );
  }
}
