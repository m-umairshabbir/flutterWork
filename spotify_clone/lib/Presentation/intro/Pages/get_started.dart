  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/Common/widgets/button/basic_button.dart';
import 'package:spotify_clone/Core/Config/Themes/app_colors.dart';
import 'package:spotify_clone/Core/Config/assets/app_images.dart';
import 'package:spotify_clone/Core/Config/assets/app_vectors.dart';

class GetStartedPage extends StatelessWidget {
    const GetStartedPage({super.key});
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(

        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.getStartedBgc),
                fit: BoxFit.fill),
              ),
            ),
           Container(
             color: Colors.black.withOpacity(0.15),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:40,vertical: 50 ),
              child: Column(
                children: [
                  Align(
                      alignment:Alignment.topCenter,
                      child: Hero(tag: 'logo',
                      child: SvgPicture.asset(AppVectors.logo))),
                  const Spacer(),
                  const Text('Enjoy Listening to Music',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),),
                  const SizedBox(height: 21,),
                  const  Text('Im Muhammad Umair Shabbir my ultimate goal is to clone this spotify app and So that i can add it in to my profiles to showcase my skills of creating apps in flutter',style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w500
                  ),
                    textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  BasicAppButton(text: "Get Started", callBack: (){
                    Navigator.pushNamed(context,'/chooseMode');
                  }),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
  