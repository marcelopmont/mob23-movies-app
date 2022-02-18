import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/presentation/login/login_presenter.dart';
import 'package:movies_app/ui/utils/strings/string_resource.dart';
import 'package:movies_app/ui/widgets/rounded_button.dart';
import 'package:movies_app/ui/widgets/rounded_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login_screen';

  const LoginScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) {
    presenter.showLoginFailed.listen((show) {
      if (show) {
        Get.snackbar(
          R.string.loginFailTitle,
          R.string.loginFailDescription,
          snackPosition: SnackPosition.BOTTOM,
        );
        presenter.showLoginFailed.value = false;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 32),
                const Icon(Icons.movie_outlined),
                const Text('Movie App'),
                const SizedBox(height: 32),
                Obx(
                  () => RoundedTextField(
                    hintText: R.string.loginEmail,
                    onChanged: presenter.onEmailChanged,
                    errorText: presenter.showEmailInvalid.value
                        ? R.string.loginEmailError
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => RoundedTextField(
                    hintText: R.string.loginPassword,
                    obscureText: true,
                    onChanged: presenter.onPasswordChanged,
                    errorText: presenter.showPasswordInvalid.value
                        ? R.string.loginEmailError
                        : null,
                  ),
                ),
                const SizedBox(height: 32),
                Obx(
                  () => RoundedButton(
                    text: R.string.loginButton,
                    onPressed: presenter.loginButtonIsEnabled.value
                        ? presenter.onLoginWithEmail
                        : null,
                  ),
                ),
                const SizedBox(height: 32),
                const Divider(thickness: 1),
                const SizedBox(height: 32),
                RoundedButton(
                  text: R.string.loginGoogleButton,
                  onPressed: presenter.onLoginWithGooglePressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
