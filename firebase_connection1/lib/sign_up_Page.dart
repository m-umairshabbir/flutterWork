import 'package:firebase_connection1/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  signUp(String email, String pass)async{
    if(email.isEmpty || pass.isEmpty){
      UiHelper.customAlertBox(context, "Enter Required Fields");
    }else{
      UserCredential? userCredentials;
      try{
        userCredentials=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title:'HomePage')));
        });
      }on FirebaseAuthException catch(ex){
        return UiHelper.customAlertBox(context, ex.code.toString());
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle,size: 100,color: Colors.blue,),
          UiHelper.customTextField(emailController, 'Email', Icons.mail, false, Colors.blue),
          UiHelper.customTextField(passController, 'Password', Icons.password, true, Colors.blue),
          const SizedBox(
            height: 30,
          ),
          UiHelper.customButton((){
              signUp(emailController.text, passController.text);

          }, 'Sign Up'),
        ],
      ),
    );
  }
}
