import 'package:firebase_prctice/screens/login_screen.dart';
import 'package:firebase_prctice/screens/signup_screen.dart';
import 'package:firebase_prctice/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  static const String id = 'landing_screen';
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey.shade900, end: Colors.white)
        .animate(animController);

    animController.forward();

    animController.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 48,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        speed: const Duration(milliseconds: 150),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 44,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              CustomElevatedButton(
                text: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                backgroundColor: Colors.lightBlueAccent,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.pushNamed(context, SignUp.id);
                },
                backgroundColor: Colors.blueAccent,
              ),

            ]),
      )),
    );
  }
}
