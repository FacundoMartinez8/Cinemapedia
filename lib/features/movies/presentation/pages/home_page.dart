import 'package:cinemapedia/core/widgets/custom_app_bar_widget.dart';
import 'package:cinemapedia/core/widgets/custom_navigator_bar_widget.dart';

import 'package:cinemapedia/features/movies/presentation/widgets/now_playing_movie.dart';
import 'package:cinemapedia/features/movies/presentation/widgets/popular_movie.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomAppBar(),
          MovieSlideShows(),
          ListViewHorizontalPopular(),
          ListViewHorizontalPopular(),
          ListViewHorizontalPopular(),
        ]),
      ),
      bottomNavigationBar: MyCustomNavigationBar(),
    );
  }
}
