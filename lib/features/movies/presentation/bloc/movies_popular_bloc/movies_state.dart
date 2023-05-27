part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class OnLoadingMovie extends MovieState {}

class OnLoaderPopularMovies extends MovieState {
  final List<Movie> movies;
  OnLoaderPopularMovies({required this.movies});
}

class OnFaileruPopularMovie extends MovieState {
  final Failure failure;
  OnFaileruPopularMovie({required this.failure});
}
