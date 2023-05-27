part of 'movie_bloc.dart';

abstract class MovieEvent {}

class ActionGetUpcoming extends MovieEvent {
  final NoParams noParams;
  ActionGetUpcoming(
    this.noParams,
  );
}
