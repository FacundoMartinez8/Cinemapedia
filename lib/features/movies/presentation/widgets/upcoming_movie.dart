import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/widgets/list_view_horizontal_widget.dart';
import 'package:cinemapedia/core/widgets/loading_widget.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movie_upcoming_bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewHorizontalUpcoming extends StatefulWidget {
  const ListViewHorizontalUpcoming({super.key});

  @override
  State<ListViewHorizontalUpcoming> createState() =>
      _ListViewHorizontalUpcomingState();
}

class _ListViewHorizontalUpcomingState
    extends State<ListViewHorizontalUpcoming> {
  final _bloc = getIt<MovieUpcomingBloc>();
  @override
  void initState() {
    super.initState();
    _bloc.add(ActionGetUpcoming(NoParams()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,
      // height: 350,
      // width: double.infinity,
      child: BlocConsumer<MovieUpcomingBloc, MovieState>(
          bloc: _bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is OnLoadingMovie) {
              return const LoadingWidget();
            } else if (state is OnLoaderUpcoming) {
              final movie = state.movies;
              return ListViewHorizontal(
                movies: state.movies,
                title: 'Proximamente',
                moviesLentgh: movie.length,
              );
            }
            return Text('no funca hno');
            //
          }),
    );
  }
}
