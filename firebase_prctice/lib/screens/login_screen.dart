import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_prctice/screens/chat_screen.dart';
import 'package:firebase_prctice/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_prctice/ui_helper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailLoginTextController = TextEditingController();
  var passwordLoginTextController = TextEditingController();

  final _auth=FirebaseAuth.instance;
  bool _loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        progressIndicator: const SpinKitCircle(color: Colors.blueAccent,),
        child: SafeArea(
            child: SafeArea(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailLoginTextController,
                labelText: 'Email',
                hintText: 'Enter email!',
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: passwordLoginTextController,
                labelText: 'Password',
                hintText: 'Enter Password!',
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                isObscure: true,
                suffixIcon: const Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(text: 'Login', onPressed: () async{
                try {
                  setState(() {
                    _loading=true;
                  });
                  final user= await _auth.signInWithEmailAndPassword(
                      email: emailLoginTextController.text,
                      password: passwordLoginTextController.text);
                  if(user!=null){
                    setState(() {
                      _loading=false;
                    });
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                }catch(e){}
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, SignUp.id);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blueAccent),
                      ))
                ],
              )
            ],
          ),
        ))),
      ),
    );
  }
}
