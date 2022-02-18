import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/domain/usecases/login/register_with_email.dart';

class RemoteRegisterWithEmail extends RegisterWithEmail {
  RemoteRegisterWithEmail({
    required this.firebaseAuth,
  });

  FirebaseAuth firebaseAuth;

  @override
  Future<User?> execute({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch(error){
      return null;
    }
  }
}
