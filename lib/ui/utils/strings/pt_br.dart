import 'package:movies_app/ui/utils/strings/string_resource.dart';

class PtBr implements Translation {
  @override
  String get loginFailTitle => 'Ops';
  @override
  String get loginFailDescription => 'Ocorreu uma falha ao realizar o login';
  @override
  String get loginEmail => 'Email';
  @override
  String get loginEmailError => 'Ops, email invalido';
  @override
  String get loginPassword => 'Senha';
  @override
  String get loginPasswordError => 'Senha precisa ter mais de 6 caracteres';
  @override
  String get loginButton => 'Login';
  @override
  String get loginGoogleButton => 'Login com Google';
}