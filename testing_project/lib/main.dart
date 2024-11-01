import 'package:flutter/material.dart';
import 'package:testing_project/apitesting.dart';
import 'package:testing_project/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:TestingApi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
