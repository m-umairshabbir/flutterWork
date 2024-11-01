import 'package:clima_weather_app/screens/splash.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Clima Weather App",
      debugShowCheckedModeBanner: false,
      home:LoadingSplash(),
    );
  }
}
