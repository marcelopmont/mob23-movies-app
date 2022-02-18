import 'package:movies_app/data/http/http_client.dart';
import 'package:movies_app/data/usecases/models/movie_model.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/usecases/home/fetch_popular_movies.dart';

class RemoteFetchPopularMovies extends FetchPopularMovies {
  RemoteFetchPopularMovies({
    required this.httpClient,
  });

  HttpClient httpClient;

  @override
  Future<List<MovieEntity>> execute() async {
    final response =
        await httpClient.get(url: 'https://demo7206081.mockable.io/movies');

    return response['results']
        .map<MovieEntity>(
            (movieJson) => MovieModel.fromJson(movieJson).toEntity())
        .toList();
  }
}
