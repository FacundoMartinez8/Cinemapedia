// ignore_for_file: avoid_print

import 'package:cinemapedia/core/service/http_service.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_model.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class MovieRemoteDataSourceBase {
  final HttpServiceBase http;

  MovieRemoteDataSourceBase({required this.http});

  Future<List<MovieModel>> getMovieNowPlaying();
  Future<List<Movie>> getPopularMovie();
  Future<List<Movie>> getTopRated();
  Future<List<Movie>> getUpcoming();
}

class MovieRemoteDataSource extends MovieRemoteDataSourceBase {
  //https://api.themoviedb.org/3/movie/now_playing?api_key=47728022501f30daa62f7eaf9fccf92d&language=es-MX
  MovieRemoteDataSource({required super.http});
  String baseUrl = 'https://api.themoviedb.org/3';
  String? API_KEY = dotenv.env['THE_MOVIE_DB_KEY'];
  String language = '&language=es-MX';

  @override
  Future<List<MovieModel>> getMovieNowPlaying() async {
    print('pasa');

    final result = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/now_playing?api_key=47728022501f30daa62f7eaf9fccf92d&language=es-MX',
    );

    print(result);

    final List<dynamic> moviesList = result['results'];
    final pp = moviesList.map((a) => MovieModel.fromJson(a)).toList();
    print(pp);
    return pp;
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    //https://api.themoviedb.org/3/movie/popular?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1
    final result = await http.get(
      url: '$baseUrl/movie/popular?api_key=$API_KEY$language',
    );
    return result['results'].map<Movie>((a) => MovieModel.fromJson(a)).toList();
  }

  @override
  Future<List<Movie>> getTopRated() async {
    final result = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/top_rated?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1',
    );
    return result['results'].map<Movie>((a) => MovieModel.fromJson(a)).toList();
  }

  @override
  Future<List<Movie>> getUpcoming() async {
    final result = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/upcoming?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1',
    );
    return result['results'].map<Movie>((a) => MovieModel.fromJson(a)).toList();
  }
}
