import 'package:http/http.dart' as http;
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/nowplaying_model.dart';
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

  //upcomming movies

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
}
