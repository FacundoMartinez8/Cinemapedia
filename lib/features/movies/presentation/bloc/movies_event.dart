part of 'movies_bloc.dart';

@immutable
abstract class MovieEvent {}

class ActionGetMovies extends MovieEvent {
  final NoParams noParams;
  ActionGetMovies(this.noParams);
}
