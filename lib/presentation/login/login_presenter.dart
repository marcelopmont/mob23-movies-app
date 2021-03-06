import 'package:get/get.dart';
import 'package:movies_app/domain/usecases/login/login_with_email.dart';
import 'package:movies_app/domain/usecases/login/login_with_google.dart';
import 'package:movies_app/domain/usecases/login/register_with_email.dart';
import 'package:movies_app/ui/home/home_screen.dart';

class LoginPresenter extends GetxController {
  LoginPresenter({
    required this.registerWithEmail,
    required this.loginWithEmail,
    required this.loginWithGoogle,
  });

  RegisterWithEmail registerWithEmail;
  LoginWithEmail loginWithEmail;
  LoginWithGoogle loginWithGoogle;

  RxBool showEmailInvalid = false.obs;
  RxBool showPasswordInvalid = false.obs;
  RxBool loginButtonIsEnabled = false.obs;
  RxBool showLoginFailed = false.obs;

  String _email = '';
  String _password = '';

  void onEmailChanged(String email) {
    _email = email;
    _checkEmailAndPassword();
  }

  void onPasswordChanged(String password) {
    _password = password;
    _checkEmailAndPassword();
  }

  void onLoginWithEmail() async {
    var user = await loginWithEmail.execute(email: _email, password: _password);
    user ??= await registerWithEmail.execute(email: _email, password: _password);
    if (user != null) {
      Get.offAndToNamed(HomeScreen.id);
    } else {
      showLoginFailed.value = true;
    }
  }

  void onLoginWithGooglePressed() {
    loginWithGoogle.execute().then((user) {
      if (user != null) {
        Get.offAndToNamed(HomeScreen.id);
      } else {
        showLoginFailed.value = true;
      }
    });
  }

  void _checkEmailAndPassword() {
    final isEmailValid = GetUtils.isEmail(_email);
    final isPasswordValid = _password.length > 5;

    showEmailInvalid.value = !isEmailValid;
    showPasswordInvalid.value = !isPasswordValid;

    loginButtonIsEnabled.value = isEmailValid && isPasswordValid;
  }
}
