import 'package:movies_app/main/factories/usecases/login/remote_login_with_google_factory.dart';
import 'package:movies_app/main/factories/usecases/login/remote_login_with_password_factory.dart';
import 'package:movies_app/main/factories/usecases/login/remote_register_with_email_factory.dart';
import 'package:movies_app/presentation/login/login_presenter.dart';

LoginPresenter makeLoginPresenter() => LoginPresenter(
  registerWithEmail: makeRemoteRegisterWithEmail(),
  loginWithEmail: makeRemoteLoginWithEmail(),
  loginWithGoogle: makeRemoteLoginWithGoogle(),
);