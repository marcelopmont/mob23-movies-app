import 'package:get/get.dart';
import 'package:movies_app/domain/usecases/login/login_with_google.dart';

class LoginPresenter extends GetxController {
  LoginPresenter({
    required this.loginWithGoogle,
  });

  LoginWithGoogle loginWithGoogle;

  void onLoginWithGooglePressed() {
    loginWithGoogle.execute().then((user) {
      if (user != null) {
        // Login success
        print('Login feito com sucesso');
      } else {
        // Login failed
        print('Login falhou...');
      }
    });
  }
}
