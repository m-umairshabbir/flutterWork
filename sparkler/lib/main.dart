import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkler/Screens/Authentication/emailAuth/signin.dart';
import 'package:sparkler/Screens/Authentication/emailAuth/signup.dart';
import 'package:sparkler/Screens/Authentication/phoneAuth/phone_auth_screen_signin.dart';
import 'package:sparkler/Screens/GetStarted/get_started1.dart';
import 'package:sparkler/Screens/home_screen.dart';
import 'Bloc/Auth/emailAuthBloc/SignIn/sign_in_bloc.dart';
import 'Bloc/Auth/emailAuthBloc/SignUp/email_auth_bloc.dart';
import 'Screens/Authentication/phoneAuth/verify_otp.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure Firebase is initialized

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sparkler App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:(FirebaseAuth.instance.currentUser!=null)?'HomeScreen':"PhoneSignIn",
      routes: {
        '/': (context) => const OnBoardingScreen(),
        'SignUp': (context) => BlocProvider(
          create: (context) => SignUpBloc(),
          child: const EmailSignUp(),
        ),
        'SignIn': (context) => BlocProvider(
          create: (context) => SignInBloc(),
          child: const EmailSignIn(),
        ),
        'HomeScreen': (context) => const HomeScreen(),
        'PhoneSignIn':(context)=>const PhoneSignUpScreen(),
        'otpScreen':(context)=>const OtpScreen(),
      },
    );
  }
}
