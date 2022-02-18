import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/data/usecases/login/remote_register_with_email.dart';

RemoteRegisterWithEmail makeRemoteRegisterWithEmail() =>
    RemoteRegisterWithEmail(
      firebaseAuth: FirebaseAuth.instance,
    );
