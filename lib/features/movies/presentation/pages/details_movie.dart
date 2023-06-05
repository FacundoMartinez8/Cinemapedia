import 'package:cinemapedia/core/service/dependecies_services.dart';
import 'package:cinemapedia/core/widgets/loading_widget.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_details.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movie_get_by_id_bloc.dart/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class MovieDetailsWidget extends StatefulWidget {
  static String name = '/movie-details';
  final int movieId;

  const MovieDetailsWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget>
    with SingleTickerProviderStateMixin {
  final _bloc = getIt<MovieGetByIdBloc>();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _bloc.add(ActionGetById(id: widget.movieId));
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuad,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieGetByIdBloc, MovieState>(
        bloc: _bloc,
        listener: (context, state) {},
        builder: (context, state) {
          print(state);
          if (state is OnLoadingMovie) {
            return const LoadingWidget();
          } else if (state is OnFaileruGetByIdMovie) {
            return ErrorPage();
          } else if (state is OnLoaderGetByIdMovie) {
            final movieDatails = state.movie;
            print(movieDatails.id);
            print(movieDatails.posterPath);
            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black,
                  expandedHeight: MediaQuery.of(context).size.height * 0.7,
                  foregroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        movieDatails.title,
                        style: TextStyle(fontSize: 20),
                        //textAlign: TextAlign.left,
                      ),
                    ),
                    background: Stack(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${movieDatails.posterPath}',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topLeft,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => descriptionMovie(
                      movie: movieDatails,
                      animation: _animation,
                    ),
                  ),
                ),
              ],
            );
          }
          return const Text('error');
        },
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Peliculas NO encontrada',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Oops! Something went wrong.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              child: Text(
                'Retry',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class descriptionMovie extends StatelessWidget {
  final MovieDetails movie;
  final Animation<double> animation;

  const descriptionMovie({
    Key? key,
    required this.movie,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 230,
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Container(
                height: 240,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '${movie.originalTitle}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      '${movie.overview}',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Wrap(
              children: [
                ...movie.genres.map((e) {
                  final paddingValue = animation.value *
                      5; // Ajusta la distancia de desplazamiento según tus necesidades
                  final chipWidth = 100.0 +
                      paddingValue *
                          1; // Ajusta el ancho del chip según tus necesidades
                  final chipHeight = 40.0;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingValue,
                      vertical: paddingValue,
                    ),
                    child: AnimatedContainer(
                      width: chipWidth,
                      height: chipHeight,
                      duration: Duration(milliseconds: 500),
                      child: Chip(
                        label: Text(
                          e.name,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        backgroundColor: Colors.grey[
                            50], // Cambia el color de fondo del chip según tus necesidades
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        )
      ],
    );
  }
}
