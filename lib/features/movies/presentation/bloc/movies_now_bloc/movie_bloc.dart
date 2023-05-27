import 'dart:async';

import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_now_playing_use_case.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MovieNowBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowMoviePlayingUseCase getNowMoviePlaying;

  MovieNowBloc({required this.getNowMoviePlaying}) : super(OnLoadingMovie()) {
    on<ActionGetMovies>(_getMovies);
  }
  FutureOr<void> _getMovies(
    ActionGetMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(OnLoadingMovie());
    final result = await getNowMoviePlaying(event.noParams);
    //print(result);
    result.fold((l) => emit(OnFaileruMovie(failure: l)),
        (r) => emit(OnLoaderMovies(movies: r)));
  }
}
