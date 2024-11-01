import 'package:firebase_auth/firebase_auth.dart';

class EmailSignUpRep {
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  Future<void> emailSignUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors if needed
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      // Handle other types of errors if needed
      throw Exception('Failed to sign up: $e');
    }
  }
}
