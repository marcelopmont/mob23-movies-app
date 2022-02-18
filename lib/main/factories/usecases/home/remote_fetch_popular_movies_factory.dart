import 'package:movies_app/data/usecases/home/remote_fetch_popular_movies.dart';
import 'package:movies_app/main/factories/infra/http_client_factory.dart';

RemoteFetchPopularMovies makeRemoteFetchPopularMovies() =>
    RemoteFetchPopularMovies(httpClient: makeHttpClient());
