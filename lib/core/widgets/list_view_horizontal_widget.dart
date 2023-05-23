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
      height: 320,
      //width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
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
      //height: 200,
      margin: EdgeInsets.symmetric(horizontal: 7),
      width: 150,
      // color: Colors.black45,
      child: Column(
        children: [
          Container(
            height: 220,
            child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(20),
                child: FadeInImage(
                  placeholder:
                      AssetImage('assets/pix-vertical-placeholder.jpg'),
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                  ),
                  fit: BoxFit.cover,
                  //width: 150,
                  //height: 180,
                )),
          ),
          //Text(movie.originalTitle, maxLines: 1),
          Text(
            movie.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 130,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.star_half_outlined,
                color: Colors.yellow[800],
              ),
              Text(
                '${movie.voteAverage}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.yellow[900]),
              ),
              Spacer(),
              Text(
                '${formatVoteCount(movie.voteCount)}',
                style: TextStyle(fontWeight: FontWeight.w500),
              )
            ]),
          )
        ],
      ),
    );
  }
}

String formatVoteCount(int voteCount) {
  if (voteCount < 1000) {
    return voteCount.toString();
  } else {
    final double count = voteCount / 1000;
    final int truncatedCount = count.truncate();
    final int decimalCount = ((count - truncatedCount) * 10).truncate();

    if (decimalCount == 0) {
      return '$truncatedCount K';
    } else {
      return '$truncatedCount.$decimalCount K';
    }
  }
}
