import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/domain/usecases/login/login_with_google.dart';

class RemoteLoginWithGoogle extends LoginWithGoogle {
  RemoteLoginWithGoogle({
    required this.googleSignIn,
    required this.firebaseAuth,
});

  GoogleSignIn googleSignIn;
  FirebaseAuth firebaseAuth;

  @override
  Future<User?> execute() async {

      final googleAccount = await googleSignIn.signIn();
      final googleAuth = await googleAccount?.authentication;

      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(googleCredential);
      return userCredential.user;

  }
}
