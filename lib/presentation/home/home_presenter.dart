import 'package:get/get.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/usecases/home/fetch_popular_movies.dart';

class HomePresenter extends GetxController {
  HomePresenter({
    required this.fetchPopularMovies,
  });

  FetchPopularMovies fetchPopularMovies;

  RxList<MovieEntity> moviesList = RxList<MovieEntity>([]);

  @override
  void onInit() async {
    super.onInit();
    final list = await fetchPopularMovies.execute();
    moviesList.value = list;
  }
}
