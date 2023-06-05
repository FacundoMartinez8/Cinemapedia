import 'package:cinemapedia/features/movies/domain/entities/actor.dart';

class MovieActor extends Actor {
  MovieActor(
      {required super.adult,
      required super.gender,
      required super.id,
      required super.knownForDepartment,
      required super.name,
      required super.originalName,
      required super.popularity,
      required super.profilePath,
      required super.castId,
      required super.character,
      required super.creditId,
      required super.order});

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  factory MovieActor.fromJson(Map<String, dynamic> json) => MovieActor(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
      );
}

//'https://api.themoviedb.org/3/movie/603692/credits?api_key=47728022501f30daa62f7eaf9fccf92d&language=en-US'