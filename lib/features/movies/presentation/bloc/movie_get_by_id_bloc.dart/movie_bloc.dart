import 'dart:async';

import 'package:cinemapedia/core/failures/failure.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_details.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_movie_by_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MovieGetByIdBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieById getByIdUseCase;
  MovieGetByIdBloc({required this.getByIdUseCase}) : super(OnLoadingMovie()) {
    on<ActionGetById>(_getMovieById);
  }
  FutureOr<void> _getMovieById(
    ActionGetById event,
    Emitter<MovieState> emit,
  ) async {
    emit(OnLoadingMovie());
    final result = await getByIdUseCase(event.id);
    print(result);
    result.fold(
      (l) => emit(OnFaileruGetByIdMovie(failure: l)),
      (r) => emit(OnLoaderGetByIdMovie(movie: r)),
    );
  }
}
