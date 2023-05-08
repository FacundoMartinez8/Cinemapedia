import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/utils/use_case_base.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_model.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/repository/movie_repository_base.dart';
import 'package:dartz/dartz.dart';

class GetNowMoviePlayingUseCase
    extends UseCaseBase<List<MovieModel>, NoParams> {
  final MovieRepositoryBase repository;

  GetNowMoviePlayingUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MovieModel>>> call(NoParams NoParams) {
    return repository.getNowMoviePlaying();
  }
}
