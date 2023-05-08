import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/use_case/no_params.dart';
import 'package:cinemapedia/core/widgets/custom_app_bar_widget.dart';
import 'package:cinemapedia/core/widgets/custom_navigator_bar_widget.dart';
import 'package:cinemapedia/core/widgets/generic_failure_widget.dart';
import 'package:cinemapedia/core/widgets/loading_widget.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:cinemapedia/features/movies/presentation/widgets/now_playing_movie.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const CustomAppBar(),
        MovieSlideShows(),
      ]),
      bottomNavigationBar: MyCustomNavigationBar(),
    );
  }
}
