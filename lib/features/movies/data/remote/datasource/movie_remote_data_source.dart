import 'package:cinemapedia/core/service/http_service.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_model.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class MovieRemoteDataSourceBase {
  final HttpServiceBase http;

  MovieRemoteDataSourceBase(this.http);

  Future<List<Movie>> getMovieNowPlaying(int);
}

class MovieRemoteDataSource extends MovieRemoteDataSourceBase {
  MovieRemoteDataSource(super.http);
  String baseUrl = 'https://api.themoviedb.org/3';
  String? API_KEY = dotenv.env['THE_MOVIE_DB_KEY'];
  String language = '&language=es-MX';

  @override
  Future<List<Movie>> getMovieNowPlaying(int) async {
    final result = await http.get(
      url: '$baseUrl/movie/now_playing?api_key=$API_KEY$language',
    );

    return result['results'].map<Movie>((a) => MovieModel.fromJson(a)).toList();
  }
}
