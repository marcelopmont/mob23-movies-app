import 'package:flutter/material.dart';
import 'package:movies_app/presentation/home/home_presenter.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';

  const HomeScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('Lista dos filmes'),
      ),
    );
  }
}
