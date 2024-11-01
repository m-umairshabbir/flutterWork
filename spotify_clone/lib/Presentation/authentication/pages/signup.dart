import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/Common/helpers/is_darkMode.dart';
import 'package:spotify_clone/Common/widgets/AppBar/custom_appbar.dart';
import 'package:spotify_clone/Common/widgets/button/basic_button.dart';
import 'package:spotify_clone/Core/Config/assets/app_vectors.dart';

import '../../../Core/Config/Themes/app_colors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Hero(
            tag: 'logo',
            child: SvgPicture.asset(
              AppVectors.logo,
              width: 40,
              height: 40,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Register",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: context.isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 50,
              ),
              const TextField(
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  labelText: 'Full Name'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                cursorColor: AppColors.primary,
                decoration: InputDecoration(

                  labelText: 'Password'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BasicAppButton(text: 'Create Account', callBack: (){}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text('Do you have an account?'),
                  TextButton(onPressed: (){}, child: const Text('Sign In',style: TextStyle(
                    color: AppColors.primary
                  ),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
