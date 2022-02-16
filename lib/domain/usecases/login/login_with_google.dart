import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginWithGoogle {
  Future<User?> execute();
}