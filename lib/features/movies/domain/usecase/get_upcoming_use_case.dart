import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/use_case/use_case_base.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/repository/movie_repository_base.dart';
import 'package:dartz/dartz.dart';

class GetUpcoming extends UseCaseBase<List<Movie>, NoParams> {
  final MovieRepositoryBase repository;

  GetUpcoming({required this.repository});
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return repository.getUpcoming();
  }
}
