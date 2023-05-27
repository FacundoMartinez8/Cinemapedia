import 'package:cinemapedia/features/movies/presentation/pages/details_movie.dart';
import 'package:cinemapedia/features/movies/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomePage.name,
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: '/movie-details',
    name: MovieDetailsWidget.name,
    builder: (context, state) {
      // final movieId = int.parse(state.params['movieId']!);
      return MovieDetailsWidget();
    },
  )
]);
