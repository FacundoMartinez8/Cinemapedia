import 'dart:async';

import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_now_playing_use_case.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_popular_movie_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowMoviePlayingUseCase getNowMoviePlaying;
  final GetPopularMovieUseCase getPopularMovie;

  MovieBloc({
    required this.getNowMoviePlaying,
    required this.getPopularMovie,
  }) : super(OnLoadingMovie()) {
    on<ActionGetMovies>(_getNowMoviePlaying);
    on<ActionGetPopularMovies>(_getPopularMovie);
  }

  FutureOr<void> _getNowMoviePlaying(
    ActionGetMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(OnLoadingMovie());
    print('hola');
    final result = await getNowMoviePlaying(event.noParams);
    print(result);

    result.fold((l) => emit(OnFaileruMovie(failure: l)),
        (r) => emit(OnLoaderMovies(movies: r)));
  }

  FutureOr<void> _getPopularMovie(
    ActionGetPopularMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(OnLoadingMovie());
    //print('hola');
    final result = await getPopularMovie(event.noParams);
    //print(result);

    result.fold((l) => emit(OnFaileruPopularMovie(failure: l)),
        (r) => emit(OnLoaderPopularMovies(movies: r)));
  }
}
