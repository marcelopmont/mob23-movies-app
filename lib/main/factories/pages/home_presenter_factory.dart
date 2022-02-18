import 'package:movies_app/main/factories/usecases/home/remote_fetch_popular_movies_factory.dart';
import 'package:movies_app/presentation/home/home_presenter.dart';

HomePresenter makeHomePresenter() =>
    HomePresenter(fetchPopularMovies: makeRemoteFetchPopularMovies());
