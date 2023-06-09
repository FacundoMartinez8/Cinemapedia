import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/widgets/list_view_horizontal_widget.dart';
import 'package:cinemapedia/core/widgets/loading_widget.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movies_popular_bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewHorizontalPopular extends StatefulWidget {
  const ListViewHorizontalPopular({super.key});

  @override
  State<ListViewHorizontalPopular> createState() =>
      _ListViewHorizontalPopularState();
}

class _ListViewHorizontalPopularState extends State<ListViewHorizontalPopular> {
  final _bloc = getIt<MoviePopularBloc>();
  @override
  void initState() {
    super.initState();
    _bloc.add(ActionGetPopularMovies(NoParams()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<MoviePopularBloc, MovieState>(
          bloc: _bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is OnLoadingMovie) {
              return const LoadingWidget();
            } else if (state is OnLoaderPopularMovies) {
              final movie = state.movies;
              return ListViewHorizontal(
                movies: state.movies,
                title: 'En cines',
                moviesLentgh: movie.length,
              );
            }
            return Text('no funca hno');
          }),
    );
  }
}
