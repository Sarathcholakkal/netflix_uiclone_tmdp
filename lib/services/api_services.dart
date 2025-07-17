import 'package:http/http.dart' as http;
import 'package:netflix_uiclone/common/utils.dart';
import 'package:netflix_uiclone/models/movie_modal.dart';

var key = "?api_key=$apiKey";

class ApiServices {
  // now plaing movies

  Future<Movie?> fetchMovies() async {
    try {
      const endPoint = "movie/now_playing";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return movieFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }

  //upcomming movies

  Future<Movie?> fetchMovies() async {
    try {
      const endPoint = "movie/now_playing";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return movieFromJson(response.body);
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Error fecthing movies:$e");
      return null;
    }
  }
}
