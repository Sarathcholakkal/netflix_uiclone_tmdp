import 'package:http/http.dart' as http;
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/hot_news_model.dart';
import 'package:netflix_uiclone/models/movie_details_model.dart';
import 'package:netflix_uiclone/models/movie_recommadation_model.dart';
import 'package:netflix_uiclone/models/nowplaying_model.dart';
import 'package:netflix_uiclone/models/popular_tvseries_model.dart';
import 'package:netflix_uiclone/models/search_movie.dart';
import 'package:netflix_uiclone/models/toprated_model.dart';
import 'package:netflix_uiclone/models/trending_netflix.dart';
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

  Future<TrendingNetflix?> fetchTrendinNetflix() async {
    try {
      const endPoint = "trending/movie/day";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);
      if (response.statusCode == 200) {
        return trendingNetflixFromJson(response.body);
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

  //movie details page
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
  //movie recommedation

  Future<MovieRecommedations?> fetchMovieRecommedation(int movieId) async {
    try {
      final endPoint = "movie/$movieId/recommendations";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return movieRecommedationsFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  // searhc movie
  Future<SearchMovie?> fetchseachedmovie(String query) async {
    try {
      final endPoint = "search/movie?query=$query";
      final apiUrl = "$baseUrl$endPoint";
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NGMxZWU5N2NhMWUzMjQwNjhmODdlNWEyYzRiYTc4YyIsIm5iZiI6MTcwMTEzNTAyMy45ODU5OTk4LCJzdWIiOiI2NTY1NDJhZmE4YjJjYTAxMGJjMGI0NWYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.fzSqaU_4IkXq7mb2KUYbaFXy6PcMvY0sKzTcksr9KfI ",
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

  //hot and news

  // Future<HotNews?> fetchHotNews() async {
  //   try {
  //     const endPoint = "tv/popular";
  //     final apiUrl = "$baseUrl$endPoint$key";
  //     final response = await http.get(Uri.parse(apiUrl));
  //     if (response.statusCode == 200) {
  //       return hotNewsFromJson(response.body);
  //     } else {
  //       throw Exception("Failed to load movies");
  //     }
  //   } catch (e) {
  //     print("Error fecthing movies:$e");
  //     return null;
  //   }
  // }
}


// curl --request GET \
//      --url 'https://api.themoviedb.org/3/search/movie?include_adult=false&language=en-US&page=1' \
//      --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NGMxZWU5N2NhMWUzMjQwNjhmODdlNWEyYzRiYTc4YyIsIm5iZiI6MTcwMTEzNTAyMy45ODU5OTk4LCJzdWIiOiI2NTY1NDJhZmE4YjJjYTAxMGJjMGI0NWYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.fzSqaU_4IkXq7mb2KUYbaFXy6PcMvY0sKzTcksr9KfI' \
//      --header 'accept: application/json'