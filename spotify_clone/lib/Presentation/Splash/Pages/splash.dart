import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/Core/Config/assets/app_vectors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigate to main screen using the named route '/main'
      Navigator.pushReplacementNamed(context, '/getStarted');
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Hero(tag: 'logo',
        child: SvgPicture.asset(AppVectors.logo)),
      ),
    );
  }
}
