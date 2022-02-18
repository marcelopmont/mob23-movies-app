import 'package:flutter/material.dart';
import 'package:movies_app/main/factories/pages/home_presenter_factory.dart';
import 'package:movies_app/ui/home/home_screen.dart';

Widget makeHomeScreen() => HomeScreen(presenter: makeHomePresenter());