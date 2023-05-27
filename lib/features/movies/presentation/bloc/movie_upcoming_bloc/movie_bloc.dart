import 'dart:async';

import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_upcoming_use_case.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movie_top_rated_bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MovieUpcomingBloc extends Bloc<MovieEvent, MovieState> {
  final GetUpcoming getUpcoming;

  MovieUpcomingBloc({required this.getUpcoming}) : super(OnLoadingMovie()) {
    on<ActionGetUpcoming>(_getTopMovies);
  }
  FutureOr<void> _getTopMovies(
    ActionGetUpcoming event,
    Emitter<MovieState> emit,
  ) async {
    emit(OnLoadingMovie());
    final result = await getUpcoming(event.noParams);
    result.fold(
      (l) => emit(OnFaileruUpcoming(failure: l)),
      (r) => emit(OnLoaderUpcoming(movies: r)),
    );
  }
}
