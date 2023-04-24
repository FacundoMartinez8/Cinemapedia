import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/features/movies/domain/repository/movie_repository_base.dart';
import 'package:dartz/dartz.dart';

class MovieRepository extends MovieRepositoryBase {
  MovieRepository({required super.remote});

  @override
  Future<Either<Failure, List<Movie>>> getNowMoviePlaying(int) async {
    try {
      return Right(
        await remote.getMovieNowPlaying(int),
      );
    } catch (e) {
      if (e is Failure) return Left(e);

      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }
}
