import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/Common/helpers/is_darkMode.dart';
import 'package:spotify_clone/Common/widgets/AppBar/custom_appbar.dart';
import 'package:spotify_clone/Core/Config/assets/app_images.dart';
import 'package:spotify_clone/Core/Config/assets/app_vectors.dart';

import '../../../Common/widgets/button/basic_button.dart';
import '../../../Core/Config/Themes/app_colors.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          const CustomAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                AppImages.authBgc,
              )),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(tag: 'logo',
                  child: SvgPicture.asset(AppVectors.logo)),
                  const SizedBox(
                    height: 55,
                  ),
                  Text(
                    'Enjoy Listening to Music',
                    style: TextStyle(
                        color: context.isDarkMode?Colors.white:Colors.blueGrey.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 21),
                  const Text(
                    'Spotify is proprietary Swedish streaming and media service provider',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: BasicAppButton(
                            text: 'Register',
                            callBack: () {
                              Navigator.pushNamed(context,'/signupPage' );
                            },
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context,'/signinPage' );
                          },
                          child: Text(
                            "Signin",
                            style: TextStyle(
                                color:context.isDarkMode? Colors.white:Colors.blueGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
