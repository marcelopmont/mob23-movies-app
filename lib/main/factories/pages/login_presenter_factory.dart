import 'package:movies_app/main/factories/usecases/remote_login_with_google_factory.dart';
import 'package:movies_app/presentation/login/login_presenter.dart';

LoginPresenter makeLoginPresenter() => LoginPresenter(
  loginWithGoogle: makeRemoteLoginWithGoogle(),
);