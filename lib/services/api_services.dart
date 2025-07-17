import 'package:http/http.dart' as http;
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/nowplaying_model.dart';
import 'package:netflix_uiclone/models/popular_tvseries_model.dart';
import 'package:netflix_uiclone/models/toprated_model.dart';
import 'package:netflix_uiclone/models/trending_model.dart';
import 'package:netflix_uiclone/models/upcomming_model.dart';

var key = "?api_key=$apiKey";

class ApiServices {
  // now plaing movies

  Future<Movie?> fetchMovies() async {
    try {
      const endPoint = "movie/now_playing";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return upcommingMovieFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  //upcoming movies

  Future<UpcommingMovies?> fetchupcommingMovie() async {
    try {
      const endPoint = "movie/upcoming";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return upcommingMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  //trending movies

  Future<TrendingMovies?> fetchTrendingMovies() async {
    try {
      const endPoint = "trending/movie/day";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
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

  //toprated movies
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

  //popular tv series

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
}
