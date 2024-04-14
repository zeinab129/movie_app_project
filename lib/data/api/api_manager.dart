import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_project/data/model/movie_model.dart';

class ApiManager {
  static const String API_KEY = "493929d6b5018017551ab5ca91ba6101";
  static const String AUTHORIZATION =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYjRmNzkyNzA5YTI0ZTliZWEyZTg4MTA3MzdiY2ZhNyIsInN1YiI6IjY2MDMxMzkwNzcwNzAwMDE0OTA4MmI3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bIIi9QqaBRyEzrciAxr9Op5KAeTtk9VNjKy3SDEbOU0";
  static const String BASE_URL = "api.themoviedb.org";
  static const String IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w500/";

  static const Map<String, String> headers = {
    "Authorization": AUTHORIZATION,
    "accept": "application/json"
  };

  static Future<MoviesModel> getPopular() async {
    Uri url = Uri.https(BASE_URL, "/3/movie/popular", {"language": "en-US"});
    http.Response response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return MoviesModel.fromJson(json);
  }

  static Future<MoviesModel> getNewReleases() async {
    Uri url = Uri.https(BASE_URL, "/3/movie/upcoming", {"language": "en-US"});
    http.Response response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return MoviesModel.fromJson(json);
  }

  static Future<MoviesModel> getRecommended() async {
    Uri url = Uri.https(BASE_URL, "/3/movie/top_rated", {"language": "en-US"});
    http.Response response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return MoviesModel.fromJson(json);
  }

  static Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    Uri url = Uri.https(BASE_URL, "/3/movie/${movieId}", {"language": "en-US"});
    http.Response response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return MovieDetailsModel.fromJson(json);
  }

  static Future<MoviesModel> getSimilarMovies(int movieId) async {
    Uri url = Uri.https(BASE_URL, "/3/movie/${movieId}/similar",
        {"language": "en-US", "page": "1"});
    http.Response response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return MoviesModel.fromJson(json);
  }

  static Future<MoviesModel> getSearchedMovies(String search) async {
    Uri url = Uri.https(BASE_URL, "/3/search/movie", {
      "language": "en-US",
      "page": "1",
      "query": search
    });
    http.Response response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return MoviesModel.fromJson(json);
  }

  static Future<GenresModel> getGenres() async {
    Uri url = Uri.https(BASE_URL, "/3/genre/movie/list",
        {"language": "en-US"});
    http.Response response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return GenresModel.fromJson(json);
  }

  static Future<MoviesModel> getFilteredMovies(String genId) async {
    Uri url = Uri.https(BASE_URL, "/3/discover/movie",
        {"language": "en-US", "with_genres": genId});
    http.Response response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return MoviesModel.fromJson(json);
  }

}
