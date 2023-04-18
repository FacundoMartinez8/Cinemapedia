import 'dart:async';

import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_now_playing_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowMoviePlayingUseCase getNowMoviePlaying;

  MovieBloc({required this.getNowMoviePlaying}) : super(OnLoadingMovie()) {
    on<ActionGetMovies>(_getNowMoviePlaying);
  }

  FutureOr<void> _getNowMoviePlaying(
    ActionGetMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(OnLoadingMovie());
    final result = await getNowMoviePlaying(event.page);

    result.fold((l) => emit(OnFaileruMovie(failure: l)),
        (r) => emit(OnLoaderMovies(movies: r)));
  }
}
