import 'dart:developer';

import 'package:bin_vigin_admin/utils/app_colors.dart';
import 'package:bin_vigin_admin/utils/app_images.dart';
import 'package:bin_vigin_admin/utils/custom_widgets/custom_text_field.dart';
import 'package:bin_vigin_admin/utils/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool validate() {
    if (emailController.text.isEmpty) {
      UIHelper.showToast("Email must not be empty!");
      return false;
    } else if (passwordController.text.isEmpty) {
      UIHelper.showToast("Password must not be empty!");
      return false;
    }
    return true;
  }

  Future<void> signIn() async {
    try {
      if (validate()) {
        UIHelper.showLoading();
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        emailController.clear();
        passwordController.clear();
        log("Sign in successfully!");
      }
    } catch (e) {
      UIHelper.showToast(e.toString());
    } finally {
      UIHelper.dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Image(
          image: AssetImage(AppImages.loginBackground),
          fit: BoxFit.fill,
        )),
        Positioned(
          left: 20,
          right: 300,
          top: 100,
          bottom: 100,
          child: Center(
            child: Card(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: SizedBox(
                  width: 380,
                  child: Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BinVigil",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Welcome back!!!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 14),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                            text: "Email",
                            controller: emailController,
                            hintText: "Enter Email"),
                        SizedBox(height: 8),
                        CustomTextField(
                            text: "Password",
                            obscureText: true,
                            controller: passwordController,
                            hintText: "Enter Password"),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            signIn();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Sign in",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryDarkColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
