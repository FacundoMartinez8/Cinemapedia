import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/features/movies/data/remote/datasource/movie_remote_data_source.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_model.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_top_rated_use_case.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_upcoming_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepositoryBase {
  final MovieRemoteDataSourceBase remote;

  MovieRepositoryBase({required this.remote});
  Future<Either<Failure, List<MovieModel>>> getNowMoviePlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovie();
  Future<Either<Failure, List<Movie>>> getTopRated();
  Future<Either<Failure, List<Movie>>> getUpcoming();
}
