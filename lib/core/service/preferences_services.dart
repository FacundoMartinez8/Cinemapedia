import 'dart:convert';

import 'package:cinemapedia/features/movies/data/remote/models/movie_model.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveMovies(List<MovieModel> movies) async {
    final encodedMovies =
        movies.map((movie) => jsonEncode(movie.toJson())).toList();
    await _prefs!.setStringList('cachedMovies', encodedMovies);
  }

  static List<Movie> getCachedMovies() {
    final cachedMovies = _prefs!.getStringList('cachedMovies');
    if (cachedMovies != null) {
      return cachedMovies
          .map((encodedMovie) => MovieModel.fromJson(
              jsonDecode(encodedMovie) as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
