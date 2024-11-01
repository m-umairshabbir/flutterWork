import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkler/Widgets/InPutField/custom_text_field.dart';

import '../../../Bloc/Auth/emailAuthBloc/SignUp/email_auth_bloc.dart';
import '../../../Bloc/Auth/emailAuthBloc/SignUp/email_auth_event.dart';
import '../../../Bloc/Auth/emailAuthBloc/SignUp/email_auth_state.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({super.key});

  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController cPasswordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) async {
          if (state.status == SignUpStatus.loading) {
            // Show loading indicator (can be a CircularProgressIndicator)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signing Up...')),
            );
          } else if (state.status == SignUpStatus.success) {

            Navigator.pushReplacementNamed(context, 'HomeScreen'); // Change to your home route
          } else if (state.status == SignUpStatus.failure) {
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SignUp",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'SignIn');
                        },
                        child: const Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              side: BorderSide(color: Colors.orange, width: 2)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 18),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ),
                        ),
                      )
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.shade300,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt),
                            iconSize: 40,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(

                          icon: Icons.email_outlined,
                          label: "Email",
                          hint: "example@gmail.com",
                          keyboardType: TextInputType.emailAddress, controller: emailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          icon: Icons.password_sharp,
                          label: "Password",
                          hint: "Password here!",
                          keyboardType: TextInputType.text,
                          isObscure: true, controller: passwordController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          icon: Icons.password_sharp,
                          label: "Confirm password",
                          hint: "Password here!",
                          keyboardType: TextInputType.text,
                          isObscure: true, controller: cPasswordController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          icon: Icons.phone,
                          label: "Phone",
                          hint: "Phone here!",
                          keyboardType: TextInputType.phone, controller:phoneController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            context.read<SignUpBloc>().add(SignUpButtonPressed(
                              email: email,
                              password: password,
                            ));

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
                            "Sign Up",
                            style: TextStyle(fontSize: 20, height: 3),
                          ),
                        ),
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
