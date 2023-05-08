import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/widgets/loading_widget.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies_bloc.dart';

class MovieSlideShows extends StatefulWidget {
  MovieSlideShows({super.key});

  @override
  State<MovieSlideShows> createState() => _MovieSlideShowsState();
}

class _MovieSlideShowsState extends State<MovieSlideShows> {
  final _bloc = getIt<MovieBloc>();
  @override
  void initState() {
    super.initState();
    _bloc.add(ActionGetMovies(NoParams()));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: BlocConsumer<MovieBloc, MovieState>(
            bloc: _bloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is OnLoadingMovie) {
                return const LoadingWidget();
              } else if (state is OnLoaderMovies) {
                final movies = state.movies;
                return Swiper(
                  viewportFraction: 0.8,
                  scale: 0.9,
                  autoplay: true,
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _Slider(movie: movies[index]);
                  },
                );
              } else if (state is OnFaileruMovie) {
                return const Center(
                  child: Text('error'),
                );
              }
              return Text('hola');
            }));
  }
}

class _Slider extends StatelessWidget {
  final Movie movie;
  _Slider({
    required this.movie,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
      ),
    );
  }
}
