part of 'movie_bloc.dart';

abstract class MovieState {}

class OnLoadingMovie extends MovieState {}

class OnLoaderGetByIdMovie extends MovieState {
  final MovieDetails movie;
  OnLoaderGetByIdMovie({required this.movie});
}

class OnFaileruGetByIdMovie extends MovieState {
  final Failure failure;
  OnFaileruGetByIdMovie({required this.failure});
}
