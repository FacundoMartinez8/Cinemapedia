import 'package:cinemapedia/core/service/http_service.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_details.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_model.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class MovieRemoteDataSourceBase {
  final HttpServiceBase http;

  MovieRemoteDataSourceBase({required this.http});

  Future<List<Movie>> getMovieNowPlaying();
  Future<List<Movie>> getPopularMovie();
  Future<List<Movie>> getTopRated();
  Future<List<Movie>> getUpcoming();
  Future<MovieDetails> getMovieById(int id);
}

class MovieRemoteDataSource extends MovieRemoteDataSourceBase {
  //https://api.themoviedb.org/3/movie/now_playing?api_key=47728022501f30daa62f7eaf9fccf92d&language=es-MX
  MovieRemoteDataSource({required super.http});
  String baseUrl = 'https://api.themoviedb.org/3';
  String? API_KEY = dotenv.env['THE_MOVIE_DB_KEY'];
  String language = '&language=es-MX';

  @override
  Future<List<Movie>> getMovieNowPlaying() async {
    final resultNow = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/now_playing?api_key=47728022501f30daa62f7eaf9fccf92d&language=es-MX',
    );

    final List<dynamic> moviesList = resultNow['results'];
    final pi = moviesList.map((a) => MovieModel.fromJson(a)).toList();
    return pi;
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    //https://api.themoviedb.org/3/movie/popular?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1
    final resultPop = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/popular?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1',
    );
    final List<dynamic> moviesList = resultPop['results'];
    final pp = moviesList.map((a) => MovieModel.fromJson(a)).toList();
    return pp;
  }

  @override
  Future<List<Movie>> getTopRated() async {
    final resultPop = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/top_rated?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1',
    );
    final List<dynamic> moviesList = resultPop['results'];
    final pp = moviesList.map((a) => MovieModel.fromJson(a)).toList();
    return pp;
  }

  @override
  Future<List<Movie>> getUpcoming() async {
    final resultPop = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/upcoming?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1',
    );
    final List<dynamic> moviesList = resultPop['results'];
    final pp = moviesList.map((a) => MovieModel.fromJson(a)).toList();
    return pp;
  }

  @override
  Future<MovieDetails> getMovieById(id) async {
    final Map result = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/$id?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-MX',
    );
    print(id);
    print(result);
    final movieDetails = MovieDetails.fromJson(result);
    print(movieDetails);
    return movieDetails;

    // final List<dynamic> moviesList = resultPop['results'];
    // final pp = moviesList.map((a) => MovieModel.fromJson(a)).toList();
    // return pp;
  }
}
