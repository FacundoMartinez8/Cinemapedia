import 'package:cinemapedia/core/service/http_service.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_model.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class MovieRemoteDataSourceBase {
  final HttpServiceBase http;

  MovieRemoteDataSourceBase({required this.http});

  Future<List<Movie>> getMovieNowPlaying(int);
  Future<List<Movie>> getPopularMovie();
}

class MovieRemoteDataSource extends MovieRemoteDataSourceBase {
  //https://api.themoviedb.org/3/movie/now_playing?api_key=47728022501f30daa62f7eaf9fccf92d&language=es-MX
  MovieRemoteDataSource({required super.http});
  String baseUrl = 'https://api.themoviedb.org/3';
  String? API_KEY = dotenv.env['THE_MOVIE_DB_KEY'];
  String language = '&language=es-MX';

  @override
  Future<List<Movie>> getMovieNowPlaying(int) async {
    print('pasa');

    final result = await http.get(
      url: '$baseUrl/movie/now_playing?api_key=$API_KEY$language',
    );
    print('no pasa');
    print(result);
    return result['results'].map<Movie>((a) => MovieModel.fromJson(a)).toList();
  }

  @override
  Future<List<Movie>> getPopularMovie() async {
    //https://api.themoviedb.org/3/movie/popular?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1
    final result = await http.get(
      url: '$baseUrl/movie/popular?api_key=$API_KEY$language',
    );
    return result['results'].map<Movie>((a) => MovieModel.fromJson(a)).toList();
  }
}
