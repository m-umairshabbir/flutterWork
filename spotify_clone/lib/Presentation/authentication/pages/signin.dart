import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/Common/helpers/is_darkMode.dart';

import '../../../Common/widgets/AppBar/custom_appbar.dart';
import '../../../Common/widgets/button/basic_button.dart';
import '../../../Core/Config/Themes/app_colors.dart';
import '../../../Core/Config/assets/app_vectors.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                "Sign in",
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
              BasicAppButton(text: 'Sign in', callBack: (){}),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(onPressed: (){}, child: const Text('Sign Up',style: TextStyle(
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
