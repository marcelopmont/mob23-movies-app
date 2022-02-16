import 'package:flutter/material.dart';
import 'package:movies_app/main/factories/pages/login_presenter_factory.dart';
import 'package:movies_app/ui/login/login_screen.dart';

Widget makeLoginScreen() => LoginScreen(
      presenter: makeLoginPresenter(),
    );
