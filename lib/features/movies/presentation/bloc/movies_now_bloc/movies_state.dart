part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class OnLoadingMovie extends MovieState {}

class OnLoaderMovies extends MovieState {
  final List<Movie> movies;
  OnLoaderMovies({required this.movies});
}

class OnFaileruMovie extends MovieState {
  final Failure failure;
  OnFaileruMovie({required this.failure});
}
