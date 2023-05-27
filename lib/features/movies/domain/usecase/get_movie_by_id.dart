import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/use_case/use_case_base.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_details.dart';
import 'package:cinemapedia/features/movies/domain/repository/movie_repository_base.dart';
import 'package:dartz/dartz.dart';

class GetMovieById extends UseCaseBase<MovieDetails, int> {
  final MovieRepositoryBase repository;

  GetMovieById({required this.repository});
  @override
  Future<Either<Failure, MovieDetails>> call(int id) {
    return repository.getMovieById(id: id);
  }
}
