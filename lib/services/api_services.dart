import 'package:http/http.dart' as http;
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/screen/hot_news_screen/hotnews_model/trending_today.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/details_model/movie_details_model.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/details_model/recommendation_model.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/1.now_playing.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/6.popular_movies_model.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/4.popular_tvseries_model.dart';
import 'package:netflix_uiclone/screen/search_sreen/search_model/search_movie.dart';
import 'package:netflix_uiclone/screen/movie_details_screen/details_model/similar_movies.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/5.toprated_model.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/2.trening_movies.dart';
import 'package:netflix_uiclone/screen/home_screen/home_models/3.upcoming_movies.dart';

var key = "?api_key=$apiKey";

class ApiServices {
  ApiServices._privateConstructor();

  static final ApiServices _instance = ApiServices._privateConstructor();

  static ApiServices get instance => _instance;

  //! home screen calls

  // now playing movies

  //now playing
  // used to dispaly in pageview card

  //https://api.themoviedb.org/3/movie/now_playing?api_key=64c1ee97ca1e324068f87e5a2c4ba78c
  Future<NowPlayingMovies?> fetchNowplaying() async {
    try {
      const endPoint = "movie/now_playing";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return nowPlayingMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  // trending movies
  //https://api.themoviedb.org/3/trending/movie/day?api_key=64c1ee97ca1e324068f87e5a2c4ba78c
  //  UI it display as trending on netflix
  Future<TrendingMovies?> fetchTrendingMovies() async {
    try {
      const endPoint = "trending/movie/day";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);
      if (response.statusCode == 200) {
        return trendingMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }
  //upcoming movies
  //https://api.themoviedb.org/3/movie/upcoming?api_key=64c1ee97ca1e324068f87e5a2c4ba78c

  Future<UpcomingMovies?> fetchupcommingMovie() async {
    try {
      const endPoint = "movie/upcoming";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return upcomingMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  // popular TV series
  Future<PopularTvSeries?> fetchPopualrTvseries() async {
    try {
      const endPoint = "tv/popular";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return popularTvSeriesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  // top rated movies
  Future<TopRatedMovies?> fetchTopRatedMovies() async {
    try {
      const endPoint = "movie/top_rated";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return topRatedMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  //popular movies
  //https://api.themoviedb.org/3/movie/popular?api_key=64c1ee97ca1e324068f87e5a2c4ba78c

  Future<PopularMovies?> fetchpopularmovies() async {
    try {
      const endPoint = "movie/popular";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return popularMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  //! movie details page calls..............................................
  // movie details
  Future<MovieDetails?> fetchMovieDetails(int movieId) async {
    try {
      final endPoint = "movie/$movieId";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return movieDetailsFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  // movie recommendation
  //https://api.themoviedb.org/3/movie/1011477/recommendations?api_key=64c1ee97ca1e324068f87e5a2c4ba78c
  Future<RecommandedMovies?> fetchMovieRecommedation(int movieId) async {
    try {
      final endPoint = "movie/$movieId/recommendations";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return recommandedMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  //!search movies
  // search movie
  Future<SearchMovie?> fetchseachedmovie(String query) async {
    try {
      final endPoint = "search/movie?query=$query";
      final apiUrl = "$baseUrl$endPoint";
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NGMxZWU5N2NhMWUzMjQwNjhmODdlNWEyYzRiYTc4YyIsIm5iZiI6MTcwMTEzNTAyMy45ODU5OTk4LCJzdWIiOiI2NTY1NDJhZmE4YjJjYTAxMGJjMGI0NWYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.fzSqaU_4IkXq7mb2KUYbaFXy6PcMvY0sKzTcksr9KfI",
        },
      );
      if (response.statusCode == 200) {
        return searchMovieFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  //! hot and news calls

  // trending today show as hotnews in ui
  //https://api.themoviedb.org/3/trending/all/day?api_key=64c1ee97ca1e324068f87e5a2c4ba78c
  Future<TrendingToday?> fetchtrendingtoday() async {
    try {
      const endPoint = "trending/all/day";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return trendingTodayFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  //similar movies
  //https://api.themoviedb.org/3/movie/1011477/similar?api_key=64c1ee97ca1e324068f87e5a2c4ba78c

  Future<SimilarMovies?> fetchSimilarMovies(int movieId) async {
    try {
      final endPoint = "movie/$movieId/similar";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return similarMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }
}
