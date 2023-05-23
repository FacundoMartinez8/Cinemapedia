part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class ActionGetPopularMovies extends MovieEvent {
  final NoParams noParams;
  ActionGetPopularMovies(
    this.noParams,
  );
}
