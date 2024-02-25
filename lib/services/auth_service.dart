import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? gUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );

      UserCredential results =
          await firebaseAuth.signInWithCredential(credential);
      User? userDetaisl = results.user;
    } catch (e) {
      print(e.toString());
    }
  }
}
