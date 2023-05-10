import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/widgets/list_view_horizontal_widget.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewHorizontalPopular extends StatefulWidget {
  const ListViewHorizontalPopular({super.key});

  @override
  State<ListViewHorizontalPopular> createState() =>
      _ListViewHorizontalPopularState();
}

class _ListViewHorizontalPopularState extends State<ListViewHorizontalPopular> {
  final _bloc = getIt<MovieBloc>();
  @override
  void initState() {
    super.initState();
    _bloc.add(ActionGetMovies(NoParams()));
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(builder: builder, listener: listener)
  }
}
