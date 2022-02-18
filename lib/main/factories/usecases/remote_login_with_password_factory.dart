import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/data/usecases/login/remote_login_with_email.dart';

RemoteLoginWithEmail makeRemoteLoginWithEmail() => RemoteLoginWithEmail(
      firebaseAuth: FirebaseAuth.instance,
    );
