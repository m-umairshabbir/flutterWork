import 'dart:ui';

import 'package:clima_weather_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class LoadingSplash extends StatefulWidget {
  const LoadingSplash({super.key});

  @override
  State<LoadingSplash> createState() => _LoadingSplashState();
}

class _LoadingSplashState extends State<LoadingSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2, kToolbarHeight, 40),
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child:  Stack(
                children: [

                  Align(
                    alignment: const AlignmentDirectional(0, -1.2),
                    child: Container(
                      height: 400,
                      width: 600,
                      decoration: const BoxDecoration(
                          color:Color(0xffffab40)
                      ),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.transparent
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child:  Stack(
                      children: [
                       Align(
                         alignment: Alignment.centerLeft,
                         child: Lottie.asset(
                          'assets/animations/2.json',
                          height: 300,
                          fit: BoxFit.cover,
                          reverse: false,
                          repeat: true,
                                               ),
                       ),
                      ],

                    ),
                  ),
             Align(
              alignment: Alignment.topRight, // Use Alignment.topLeft, topRight, bottomCenter, etc. for different positions
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 195),
                child: Text(
                  'Weather Sky',
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: 'ConcertOne',
                    fontWeight: FontWeight.w700,
                    color: Colors.blue.shade50,

                  ),
                ),
              ),
            ),
                ],
              ),
              ),
            ),
          ),
    );
  }
}
