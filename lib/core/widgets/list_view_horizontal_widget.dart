import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class ListViewHorizontal extends StatelessWidget {
  final String imgMovie;
  final String title;
  final String subtitle;
  final List<Movie> movies;
  final VoidCallback? loadNetxPage;
  const ListViewHorizontal(
      {required this.title,
      required this.subtitle,
      required this.movies,
      this.loadNetxPage,
      required this.imgMovie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      //width: double.infinity,
      child: Column(
        children: <Widget>[
          Row(
            children: [Text(title), Spacer(), Text('lunes')],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _slide(
                  movie: movies[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _slide extends StatelessWidget {
  final Movie movie;
  const _slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
