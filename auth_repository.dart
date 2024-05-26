import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await _firebaseAuth.currentUser.sendEmailVerification();
  }

  Future<void> login(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
