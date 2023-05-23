import 'package:cinemapedia/core/service/http_service.dart';
import 'package:cinemapedia/features/movies/data/remote/datasource/movie_remote_data_source.dart';
import 'package:cinemapedia/features/movies/data/repository/movie_repository.dart';
import 'package:cinemapedia/features/movies/domain/repository/movie_repository_base.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_now_playing_use_case.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_popular_movie_use_case.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_top_rated_use_case.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_upcoming_use_case.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movies_now_bloc.dart/movie_bloc.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movies_popular_bloc.dart/movie_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<HttpServiceBase>(() => HttpService());

  //Movie
  getIt.registerLazySingleton<MovieRemoteDataSourceBase>(
    () => MovieRemoteDataSource(http: getIt()),
  );
  getIt.registerLazySingleton<MovieRepositoryBase>(
    () => MovieRepository(remote: getIt()),
  );
  getIt.registerLazySingleton<GetNowMoviePlayingUseCase>(
    () => GetNowMoviePlayingUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetPopularMovieUseCase>(
    () => GetPopularMovieUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<GetTopRated>(
      () => GetTopRated(repository: getIt()));

  getIt.registerLazySingleton<GetUpcoming>(
      () => GetUpcoming(repository: getIt()));

  getIt.registerLazySingleton<MovieNowBloc>(
    () => MovieNowBloc(
      getNowMoviePlaying: getIt(),
    ),
  );
  getIt.registerLazySingleton<MoviePopularBloc>(
    () => MoviePopularBloc(
      getPopularMovie: getIt(),
    ),
  );
}
