import 'package:movies_app/domain/entities/movie_entity.dart';

abstract class FetchPopularMovies {
  Future<List<MovieEntity>> execute();
}