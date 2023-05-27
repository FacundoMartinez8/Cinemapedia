part of 'movie_bloc.dart';

abstract class MovieState {}

class OnLoadingMovie extends MovieState {}

class OnLoaderTopRated extends MovieState {
  final List<Movie> movies;
  OnLoaderTopRated({required this.movies});
}

class OnFaileruTopRated extends MovieState {
  final Failure failure;
  OnFaileruTopRated({required this.failure});
}
