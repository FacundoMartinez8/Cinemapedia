import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/utils/use_case_base.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/repository/movie_repository_base.dart';
import 'package:dartz/dartz.dart';

class GetNowMoviePlayingUseCase extends UseCaseBase<List<Movie>, int> {
  final MovieRepositoryBase repository;

  GetNowMoviePlayingUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(int) {
    return repository.getNowMoviePlaying(int);
  }
}
