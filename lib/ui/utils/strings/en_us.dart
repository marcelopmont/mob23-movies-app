import 'package:movies_app/ui/utils/strings/string_resource.dart';

class EnUs implements Translation {
  @override
  String get loginFailTitle => 'Ops';
  @override
  String get loginFailDescription => 'Login Error';
  @override
  String get loginEmail => 'Email';
  @override
  String get loginEmailError => 'Ops, invalid email';
  @override
  String get loginPassword => 'Password';
  @override
  String get loginPasswordError => 'Invalid password';
  @override
  String get loginButton => 'Login';
  @override
  String get loginGoogleButton => 'Login with Google';
}