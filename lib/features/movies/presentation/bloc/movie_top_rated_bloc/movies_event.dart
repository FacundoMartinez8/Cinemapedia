part of 'movie_bloc.dart';

abstract class MovieEvent {}

class ActionGetTopRated extends MovieEvent {
  final NoParams noParams;
  ActionGetTopRated(
    this.noParams,
  );
}
