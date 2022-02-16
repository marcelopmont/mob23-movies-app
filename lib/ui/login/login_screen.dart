import 'package:flutter/material.dart';
import 'package:movies_app/presentation/login/login_presenter.dart';
import 'package:movies_app/ui/widgets/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login_screen';

  const LoginScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.movie_outlined),
              const Text('Movie App'),
              const SizedBox(height: 32),
              RoundedButton(
                text: 'Login com Google',
                onPressed: presenter.onLoginWithGooglePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
