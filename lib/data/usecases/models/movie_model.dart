import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieModel {
  MovieModel({
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
  });

  String originalTitle;
  String overview;
  String posterPath;
  double voteAverage;

  factory MovieModel.fromJson(Map json) => MovieModel(
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'],
      );

  MovieEntity toEntity() => MovieEntity(
        title: originalTitle,
        description: overview,
        image: posterPath,
        rating: voteAverage.toString(),
      );
}
