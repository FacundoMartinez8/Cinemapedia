import 'dart:async';

import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_top_rated_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MovieTopRatedBloc extends Bloc<MovieEvent, MovieState> {
  final GetTopRated getTopRated;

  MovieTopRatedBloc({required this.getTopRated}) : super(OnLoadingMovie()) {
    on<ActionGetTopRated>(_getTopMovies);
  }
  FutureOr<void> _getTopMovies(
    ActionGetTopRated event,
    Emitter<MovieState> emit,
  ) async {
    emit(OnLoadingMovie());
    final result = await getTopRated(event.noParams);
    result.fold(
      (l) => emit(OnFaileruTopRated(failure: l)),
      (r) => emit(OnLoaderTopRated(movies: r)),
    );
  }
}
