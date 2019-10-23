import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseAuthAPI {
   final FirebaseAuth _auth = FirebaseAuth.instance;
   final GoogleSignIn googleSignIn = GoogleSignIn();

   Future<FirebaseUser> signIn() async {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
   }

   signOut() async {
     await _auth.signOut().then((onValue) => print("Sesión cerrada"));
     googleSignIn.signOut();
     print("sesiones cerradas");
   }
}