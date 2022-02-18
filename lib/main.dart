import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/main/factories/pages/home_screen_factory.dart';
import 'package:movies_app/main/factories/pages/login_screen_factory.dart';
import 'package:movies_app/ui/home/home_screen.dart';
import 'package:movies_app/ui/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.id,
      getPages: [
        GetPage(name: LoginScreen.id, page: makeLoginScreen),
        GetPage(name: HomeScreen.id, page: makeHomeScreen),
      ],
    );
  }
}
