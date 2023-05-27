import 'dart:async';

import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_popular_movie_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviePopularBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMovieUseCase getPopularMovie;

  MoviePopularBloc({
    required this.getPopularMovie,
  }) : super(OnLoadingMovie()) {
    on<ActionGetPopularMovies>(_getPopularMovie);
  }
  FutureOr<void> _getPopularMovie(
    ActionGetPopularMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(OnLoadingMovie());

    final result = await getPopularMovie(event.noParams);
    result.fold(
      (l) => emit(OnFaileruPopularMovie(failure: l)),
      (r) => emit(OnLoaderPopularMovies(movies: r)),
    );
  }
}
