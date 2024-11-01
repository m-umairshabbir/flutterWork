import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkler/Bloc/Auth/emailAuthBloc/SignIn/sign_in_event.dart';
import 'package:sparkler/Widgets/InPutField/custom_text_field.dart';

import '../../../Bloc/Auth/emailAuthBloc/SignIn/sign_in_bloc.dart';
import '../../../Bloc/Auth/emailAuthBloc/SignIn/sign_in_state.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({super.key});

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) async {
          if (state.status == SignInStatus.loading) {
            // Show loading indicator (can be a CircularProgressIndicator)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signing in...')),
            );
          } else if (state.status == SignInStatus.success) {
            Navigator.pushReplacementNamed(context, 'HomeScreen'); // Change to your home route
          } else if (state.status == SignInStatus.failure) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
  child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade700,
              Colors.orange.shade400,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Login Text Section
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Hey, Welcome ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // White Container with Input Fields
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      CustomTextField(icon:Icons.email_outlined,label: "Email",hint: "example@gmail.com",keyboardType: TextInputType.emailAddress, controller: emailController,),
                      const SizedBox(
                        height: 30,
                      ),

                      CustomTextField(icon:Icons.password_sharp,label: "Password",hint: "Password here!",keyboardType: TextInputType.text,isObscure: true,controller: passwordController,),
                      const SizedBox(
                        height: 40,
                      ),

                      ElevatedButton(
                          onPressed: () {
                            String email=emailController.text.trim();
                            String password=passwordController.text.trim();
                            context.read<SignInBloc>().add(SignInButtonPressed(email: email, password: password));

                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Colors.orange, width: 2))),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 20, height: 3),
                          ),),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'SignUp');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.orange,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                    color: Colors.orange, width: 1))),
                        child: const Text(
                          "Create an account",
                          style: TextStyle(fontSize: 20, height: 3),
                        ),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
),
    );
  }
}
