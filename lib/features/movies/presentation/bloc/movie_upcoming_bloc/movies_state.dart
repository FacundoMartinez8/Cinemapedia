part of 'movie_bloc.dart';

abstract class MovieState {}

class OnLoadingMovie extends MovieState {}

class OnLoaderUpcoming extends MovieState {
  final List<Movie> movies;
  OnLoaderUpcoming({required this.movies});
}

class OnFaileruUpcoming extends MovieState {
  final Failure failure;
  OnFaileruUpcoming({required this.failure});
}
