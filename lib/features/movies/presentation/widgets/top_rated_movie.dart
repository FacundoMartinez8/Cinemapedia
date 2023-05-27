import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/widgets/list_view_horizontal_widget.dart';
import 'package:cinemapedia/core/widgets/loading_widget.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movie_top_rated_bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewHorizontalTopRated extends StatefulWidget {
  const ListViewHorizontalTopRated({super.key});

  @override
  State<ListViewHorizontalTopRated> createState() =>
      _ListViewHorizontalTopRatedState();
}

class _ListViewHorizontalTopRatedState
    extends State<ListViewHorizontalTopRated> {
  final _bloc = getIt<MovieTopRatedBloc>();
  @override
  void initState() {
    super.initState();
    _bloc.add(ActionGetTopRated(NoParams()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,
      // height: 350,
      // width: double.infinity,
      child: BlocConsumer<MovieTopRatedBloc, MovieState>(
          bloc: _bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is OnLoadingMovie) {
              return const LoadingWidget();
            } else if (state is OnLoaderTopRated) {
              final movie = state.movies;
              return ListViewHorizontal(
                movies: state.movies,
                title: 'Las mas Topeadas',
                moviesLentgh: movie.length,
              );
            }
            return Text('no funca hno');
            //
          }),
    );
  }
}
