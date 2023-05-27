part of 'movie_bloc.dart';

abstract class MovieEvent {}

class ActionGetById extends MovieEvent {
  final int id;

  ActionGetById({required this.id});
}
