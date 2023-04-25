part of "movies_bloc.dart";

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

class OnLoaderPopularMovies extends MovieState {
  final List<Movie> movies;
  OnLoaderPopularMovies({required this.movies});
}

class OnFaileruPopularMovie extends MovieState {
  final Failure failure;
  OnFaileruPopularMovie({required this.failure});
}
