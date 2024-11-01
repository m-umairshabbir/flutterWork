import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PhoneSignUpRepo {

 final  String phone;
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  PhoneSignUpRepo({required this.phone});

  void myFunc()async {
    _firebaseAuth.verifyPhoneNumber(
       phoneNumber: "+92$phone",
      codeSent: (verificationID,resendToken){
       Navigator.pushNamed(context, 'otpScreen');
      },
        verificationCompleted: (credential){},
        verificationFailed: (ex){    },
    codeAutoRetrievalTimeout: (verificationId){},
      timeout:const  Duration(seconds: 30)
    );
  }
}