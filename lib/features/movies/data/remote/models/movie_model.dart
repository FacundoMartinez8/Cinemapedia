import 'package:cinemapedia/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required bool adult,
    required String backdropPath,
    required List<int> genreIds,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required DateTime releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    const imagePath = 'https://image.tmdb.org/t/p/w500';

    return MovieModel(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      genreIds: map['genre_ids'] != null
          ? List<int>.from(map['genre_ids'].map((x) => x))
          : [],
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
}
