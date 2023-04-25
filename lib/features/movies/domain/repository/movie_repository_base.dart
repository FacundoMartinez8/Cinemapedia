import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/features/movies/data/remote/datasource/movie_remote_data_source.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepositoryBase {
  final MovieRemoteDataSourceBase remote;

  MovieRepositoryBase({required this.remote});
  Future<Either<Failure, List<Movie>>> getNowMoviePlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovie();
}
