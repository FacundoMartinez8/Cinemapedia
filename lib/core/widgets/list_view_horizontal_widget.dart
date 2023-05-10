import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class ListViewHorizontal extends StatelessWidget {
  //final String imgMovie;
  final String title;
  final int moviesLentgh;
  final List<Movie> movies;
  final VoidCallback? loadNetxPage;
  const ListViewHorizontal({
    required this.title,
    required this.movies,
    this.loadNetxPage,
    required this.moviesLentgh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amberAccent,
      height: 250,
      //width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  'Lunes',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesLentgh,
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
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 7),
      width: 130,
      // color: Colors.black45,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/pix-vertical-placeholder.jpg'),
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                ),
                fit: BoxFit.cover,
                height: 180,
              )),
          //Text(movie.originalTitle, maxLines: 1),
          Text(
            movie.title,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
