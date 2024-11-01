import 'package:firebase_prctice/screens/chat_screen.dart';
import 'package:firebase_prctice/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_prctice/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class SignUp extends StatefulWidget {
  static const String id = 'signup_screen';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailTextSignUpController = TextEditingController();
  var passwordTextSignUpController = TextEditingController();

  // firebase authentication
  final _auth=FirebaseAuth.instance;
  late bool _loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        progressIndicator: SpinKitFadingCircle(color: Colors.black),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                CustomTextField(
                  keyboardType:TextInputType.emailAddress,
                  controller: emailTextSignUpController,
                  labelText: 'Email',
                  hintText: 'Enter email here!',
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  controller: passwordTextSignUpController,
                  labelText: 'Password',
                  hintText: 'Enter password here!',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  isObscure: true,
                ),
                const SizedBox(
                  height: 42,
                ),
                CustomElevatedButton(
                  text: 'SignUp',
                  onPressed: ()async{
                    setState(() {
                      _loading=true;
                    });
                    try{
                      final newUser=await _auth.createUserWithEmailAndPassword(email: emailTextSignUpController.text, password: passwordTextSignUpController.text);
                      setState(() {
                        _loading=false;
                      });
                      if(newUser!=null){

                        emailTextSignUpController.clear();
                        passwordTextSignUpController.clear();
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    }catch(e){}
                  },
                  backgroundColor: Colors.blueAccent,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, LoginScreen.id);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
