import 'dart:io';

import 'package:movies_app/ui/utils/strings/en_us.dart';
import 'package:movies_app/ui/utils/strings/pt_br.dart';

class R {
  static Translation string = EnUs();

  static void load() {
    switch(Platform.localeName) {
      case 'pt_BR': string = PtBr(); break;
      default: string = EnUs(); break;
    }
  }

}

abstract class Translation {
  String get loginFailTitle;
  String get loginFailDescription;
  String get loginEmail;
  String get loginEmailError;
  String get loginPassword;
  String get loginPasswordError;
  String get loginButton;
  String get loginGoogleButton;
}