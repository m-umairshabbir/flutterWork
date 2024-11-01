import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_prctice/screens/chat_screen.dart';
import 'package:firebase_prctice/screens/landing_screen.dart';
import 'package:firebase_prctice/screens/login_screen.dart';
import 'package:firebase_prctice/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDdkLrEDh0KXNnEhCHwoz-s6M7vEl9rvj0',
          appId: '1:1081383133723:android:951c9386c76a5303f18ebe',
          messagingSenderId: '1081383133723',
          projectId: 'flash-chat-d1360',
      ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LandingScreen.id,
        routes: {
          LandingScreen.id: (context) => const LandingScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          SignUp.id: (context) => const SignUp(),
          ChatScreen.id: (context) => const ChatScreen(),
        },
      );
    } catch (e) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: Text('Error occured:\n ${e.toString()}')),
        ),
      );
    }
  }
}
