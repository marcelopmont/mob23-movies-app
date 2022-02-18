import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/data/usecases/login/remote_login_with_google.dart';

RemoteLoginWithGoogle makeRemoteLoginWithGoogle() => RemoteLoginWithGoogle(
  googleSignIn: GoogleSignIn(),
  firebaseAuth: FirebaseAuth.instance,
);