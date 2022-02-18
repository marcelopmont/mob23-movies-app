import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/main/factories/pages/home_presenter_factory.dart';
import 'package:movies_app/presentation/home/home_presenter.dart';
import 'package:movies_app/ui/home/home_screen.dart';

Widget makeHomeScreen() {
  Get.put<HomePresenter>(makeHomePresenter());
  return const HomeScreen();
}