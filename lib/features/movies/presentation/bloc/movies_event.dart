part of 'movies_bloc.dart';

@immutable
abstract class MovieEvent {}

class ActionGetMovies extends MovieEvent {
  final int page;
  ActionGetMovies({required this.page});
}
