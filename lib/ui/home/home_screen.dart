import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:movies_app/presentation/home/home_presenter.dart';
import 'package:movies_app/ui/home/components/movie_card.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<HomePresenter>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Obx(
            () {
              final moviesList = presenter.moviesList.value;
              return IntrinsicHeight(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: IntrinsicHeight(
                    child: Row(
                      children: moviesList.map<MovieCard>((e) => MovieCard(movie: e)).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
