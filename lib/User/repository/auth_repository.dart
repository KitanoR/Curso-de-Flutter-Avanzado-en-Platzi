import 'package:firebase_auth/firebase_auth.dart';
import 'FirebaseAuth.dart';

class AuthRepository {
  final _frebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase () => _frebaseAuthAPI.signIn();

   signOut() => _frebaseAuthAPI.signOut(); 
}