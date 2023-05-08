import 'package:cinemapedia/core/service/http_service.dart';
import 'package:cinemapedia/features/movies/data/remote/models/movie_model.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_top_rated_use_case.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_upcoming_use_case.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class MovieRemoteDataSourceBase {
  final HttpServiceBase http;

  MovieRemoteDataSourceBase({required this.http});

  Future<List<Movie>> getMovieNowPlaying(int);
  Future<List<Movie>> getPopularMovie(int);
  Future<List<Movie>> getTopRated(int);
  Future<List<Movie>> getUpcoming(int);
}

class MovieRemoteDataSource extends MovieRemoteDataSourceBase {
  //https://api.themoviedb.org/3/movie/now_playing?api_key=47728022501f30daa62f7eaf9fccf92d&language=es-MX
  MovieRemoteDataSource({required super.http});
  String baseUrl = 'https://api.themoviedb.org/3';
  String? API_KEY = dotenv.env['THE_MOVIE_DB_KEY'];
  String language = '&language=es-MX';

  @override
  Future<List<Movie>> getMovieNowPlaying(int) async {
    print('pasa');

    final result = await http.get(
      url:
          'https://api.themoviedb.org/3/movie/now_playing?api_key=47728022501f30daa62f7eaf9fccf92d&language=es-MX',
    );
    final json = {
      "dates": {"maximum": "2023-05-09", "minimum": "2023-03-22"},
      "page": 1,
      "results": [
        {
          "adult": false,
          "backdrop_path": "/m1fgGSLK0WvRpzM1AmZu38m0Tx8.jpg",
          "genre_ids": [28],
          "id": 842945,
          "original_language": "en",
          "original_title": "Supercell",
          "overview":
              "Con Alec Baldwin. William sigue los pasos de su padre cazador de tormentas y ahora enfrentará el mayor desafío de su vida para seguir su legado.",
          "popularity": 768.784,
          "poster_path": "/6uaKRc0Di2pfhRLFQaH5BntSJOH.jpg",
          "release_date": "2023-03-17",
          "title": "Cazador de tormentas",
          "video": false,
          "vote_average": 6.3,
          "vote_count": 136
        },
        {
          "adult": false,
          "backdrop_path": "/yJpI96EX54KbM6W9wPizYSNP8Tv.jpg",
          "genre_ids": [12, 14, 35],
          "id": 493529,
          "original_language": "en",
          "original_title": "Dungeons & Dragons: Honor Among Thieves",
          "overview":
              "Un ladrón encantador y una banda de aventureros inverosímiles emprenden un atraco épico para recuperar una reliquia perdida, pero las cosas salen peligrosamente mal cuando se topan con las personas equivocadas.",
          "popularity": 710.322,
          "poster_path": "/77XBzUUFX5aHI3Jz3ipJTtsDWzk.jpg",
          "release_date": "2023-03-23",
          "title": "Calabozos & Dragones: Honor entre ladrones",
          "video": false,
          "vote_average": 7.5,
          "vote_count": 658
        },
        {
          "adult": false,
          "backdrop_path": "/uNK5dHo6HJpwk1BPcDHHyvX7ZLz.jpg",
          "genre_ids": [28, 53],
          "id": 983768,
          "original_language": "en",
          "original_title": "Black Warrant",
          "overview":
              "Un asesino de operaciones especiales semi-retirado y un agente de la DEA se cruzan en misiones separadas para detener a una organización terrorista cibernética que ha construido una máquina peligrosa que amenaza con atacar la red eléctrica y traer una catástrofe al mundo.",
          "popularity": 625.913,
          "poster_path": "/s95yjWcHbRpS32exC8AeA2LNWXS.jpg",
          "release_date": "2023-01-09",
          "title": "Black Warrant",
          "video": false,
          "vote_average": 5.4,
          "vote_count": 19
        },
        {
          "adult": false,
          "backdrop_path": "/exI61quYa7xMfcIDSp674UnvrhG.jpg",
          "genre_ids": [10752, 28],
          "id": 840326,
          "original_language": "fi",
          "original_title": "Sisu",
          "overview": "",
          "popularity": 617.681,
          "poster_path": "/t9VXZkgcxpIwfPUKAWOOONs0vHv.jpg",
          "release_date": "2023-01-27",
          "title": "Sisu",
          "video": false,
          "vote_average": 7.1,
          "vote_count": 27
        },
        {
          "adult": false,
          "backdrop_path": "/c3hl9E8E7b9opXDFVF5tSyk0ykr.jpg",
          "genre_ids": [16, 35, 10751, 12, 14],
          "id": 816904,
          "original_language": "es",
          "original_title": "Momias",
          "overview":
              "En las entrañas de la tierra, ¡existe una ciudad de momias! Por mandato imperial, la Princesa Nefer debe casarse con Thut, un ex auriga de carros. Ninguno desea el matrimonio; Nefer porque ansía la libertad, y Thut porque es alérgico al matrimonio. Pero los designios de los dioses son irrevocables: Thut deberá desposar a Nefer y custodiar el anillo real que el Faraón le ha otorgado; si algo le ocurriera a este, Thut perdería los ojos y la lengua. Mientras tanto, en nuestro mundo, Lord Carnaby lleva a cabo una excavación arqueológica y encuentra algo único: ¡un anillo de boda real egipcia! Thut debe ir al mundo de los humanos para recuperarlo. Le acompaña Sekhem, su hermano de 12 años, con su mascota cocodrilo, y Nefer. Juntos vivirán una gran aventura en la moderna Londres y descubrirán algo que no entraba en sus planes: enamorarse.",
          "popularity": 610.187,
          "poster_path": "/g5vkJAPj4XFlaOXZMYE97LZ7lns.jpg",
          "release_date": "2023-01-05",
          "title": "Las momias y el anillo perdido",
          "video": false,
          "vote_average": 7.1,
          "vote_count": 244
        },
        {
          "adult": false,
          "backdrop_path": "/wD2kUCX1Bb6oeIb2uz7kbdfLP6k.jpg",
          "genre_ids": [27, 53],
          "id": 980078,
          "original_language": "en",
          "original_title": "Winnie the Pooh: Blood and Honey",
          "overview":
              "Ahora asilvestrados y sedientos de sangre, Winnie the Pooh y Piglet aterrorizan a Christopher Robin y a un grupo de jóvenes en una casa remota.",
          "popularity": 598.167,
          "poster_path": "/ZmbSkGEpXFufbDhgfTnSrFAguo.jpg",
          "release_date": "2023-01-27",
          "title": "Winnie the Pooh: Sangre y Miel",
          "video": false,
          "vote_average": 5.7,
          "vote_count": 539
        },
        {
          "adult": false,
          "backdrop_path": "/qCW1DUmfWj2xLQRCRhrwkQyKROH.jpg",
          "genre_ids": [14, 28, 12],
          "id": 455476,
          "original_language": "en",
          "original_title": "Knights of the Zodiac",
          "overview":
              "Nacido bajo la estrella de Pegaso, la misión de Seiya es proteger a Siena, la reencarnación de Athena, la diosa de la sabiduría y la batalla, y salva el mundo. Cuando se da cuenta de su poder oculto, se convierte en un 'Caballero' para salvar este mundo.",
          "popularity": 580.37,
          "poster_path": "/6M4jNQaZrL86KcPqrGHb6BvQut0.jpg",
          "release_date": "2023-04-27",
          "title": "Los Caballeros del Zodiaco: Saint Seiya - El inicio",
          "video": false,
          "vote_average": 6.5,
          "vote_count": 21
        },
        {
          "adult": false,
          "backdrop_path": "/aHcWyh0n4YbBy9gxYCDlgsNVS3M.jpg",
          "genre_ids": [27, 9648, 53],
          "id": 631842,
          "original_language": "en",
          "original_title": "Knock at the Cabin",
          "overview":
              "Mientras está de vacaciones en una cabaña remota, una niña y sus padres son tomados como rehenes por cuatro extraños armados que exigen que la familia tome una decisión impensable para evitar el apocalipsis. Con acceso limitado al mundo exterior, la familia debe decidir en qué cree antes de que todo se pierda.",
          "popularity": 477.797,
          "poster_path": "/4Zna9CvyzaAgejsErmyXmHC64Dd.jpg",
          "release_date": "2023-02-01",
          "title": "Llaman a la puerta",
          "video": false,
          "vote_average": 6.4,
          "vote_count": 1382
        },
        {
          "adult": false,
          "backdrop_path": "/zGoZB4CboMzY1z4G3nU6BWnMDB2.jpg",
          "genre_ids": [28, 35, 10749],
          "id": 758009,
          "original_language": "en",
          "original_title": "Shotgun Wedding",
          "overview":
              "Darcy y Tom reúnen a sus familias para la boda de destino definitiva, pero cuando toman como rehenes a todo el grupo, \"'Til Death Do Us Part\" adquiere un significado completamente nuevo en esta hilarante aventura llena de adrenalina en la que Darcy y Tom deben salvar a sus seres queridos. si no se matan entre ellos primero.",
          "popularity": 408.844,
          "poster_path": "/3ixVYoqCATZI2mLzIHI9T5Zj2LL.jpg",
          "release_date": "2022-12-28",
          "title": "Bodas de plomo",
          "video": false,
          "vote_average": 6.3,
          "vote_count": 789
        }
      ],
      "total_pages": 88,
      "total_results": 1748
    };

    var pp = (json['result'] as List<dynamic>)
        .map<Movie>((a) => MovieModel.fromJson(a))
        .toList();
    print(pp);
    print('hola');
    return pp;
  }

  // @override
  // Future<List<Movie>> getPopularMovie() async {
  //   //https://api.themoviedb.org/3/movie/popular?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US&page=1
  //   final result = http.get(
  //     url: '$baseUrl/movie/popular?api_key=$API_KEY$language',
  //   );
  //   return result['results'].map<Movie>((a) => MovieModel.fromJson(a)).toList();
  // }

  @override
  Future<List<Movie>> getTopRated(int) {
    // TODO: implement GetTopRated
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcoming(int) {
    // TODO: implement GetUpcoming
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getPopularMovie(int) {
    // TODO: implement getPopularMovie
    throw UnimplementedError();
  }
}
