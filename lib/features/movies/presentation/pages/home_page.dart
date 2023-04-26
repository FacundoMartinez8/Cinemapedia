import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/widgets/generic_failure_widget.dart';
import 'package:cinemapedia/core/widgets/loading_widget.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static String name = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = getIt<MovieBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(ActionGetMovies(NoParams()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<MovieBloc, MovieState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnLoadingMovie) {
          return const LoadingWidget();
        } else if (state is OnLoaderMovies) {
          final movies = state.movies;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          );
        } else if (state is OnFaileruMovie) {
          return const Center(
            child: Text('error'),
          );
        }
        return Container(
          child: Text('hola'),
        );
      },
    ));
  }
}
