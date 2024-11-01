import 'package:firebase_auth/firebase_auth.dart';

class EmailSignInRep{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  Future<User?> emailSignIn(String email,String password)async{
    try{
      UserCredential userCredential=await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }catch(e){
      throw Exception(e.toString());
    }
  }

}