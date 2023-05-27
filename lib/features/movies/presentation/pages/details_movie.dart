import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/widgets/loading_widget.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movie_get_by_id_bloc.dart/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsWidget extends StatefulWidget {
  static String name = 'moviedetails';
  MovieDetailsWidget({
    super.key,
  });

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  final _bloc = getIt<MovieGetByIdBloc>();
  late final int movieId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(ActionGetById(id: movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieGetByIdBloc, MovieState>(
        bloc: _bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OnLoadingMovie) {
            return const LoadingWidget();
          } else if (state is OnLoaderGetByIdMovie) {
            return CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black,
                  expandedHeight: MediaQuery.of(context).size.height * 0.7,
                  foregroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(),
                )
              ],
            );
          }
          return Text('error');
        },
      ),
    );
  }
}
