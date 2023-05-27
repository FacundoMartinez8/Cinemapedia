import 'package:cinemapedia/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.adult,
      required super.backdropPath,
      required super.genreIds,
      required super.id,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.video,
      required super.voteAverage,
      required super.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    const imagePath = 'https://image.tmdb.org/t/p/w500';

    return MovieModel(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      genreIds: List<int>.from(map['genre_ids'].map((x) => x)),
      id: map['id'] ?? 0,
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: (map['popularity'] ?? 0.0).toDouble(),
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: (map['vote_average'] ?? 0.0).toDouble(),
      voteCount: map['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
