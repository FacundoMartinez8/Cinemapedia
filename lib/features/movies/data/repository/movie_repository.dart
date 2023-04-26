import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/features/movies/domain/repository/movie_repository_base.dart';
import 'package:dartz/dartz.dart';

class MovieRepository extends MovieRepositoryBase {
  MovieRepository({required super.remote});

  @override
  Future<Either<Failure, List<Movie>>> getNowMoviePlaying() async {
    try {
      return Right(
        await remote.getMovieNowPlaying(),
      );
    } catch (e) {
      if (e is Failure) return Left(e);

      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie() async {
    try {
      return Right(
        await remote.getPopularMovie(),
      );
    } catch (e) {
      if (e is Failure) return Left(e);

      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRated() async {
    try {
      return Right(
        await remote.getTopRated(),
      );
    } catch (e) {
      if (e is Failure) return Left(e);

      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcoming() async {
    try {
      return Right(
        await remote.getUpcoming(),
      );
    } catch (e) {
      if (e is Failure) return Left(e);

      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }
}
