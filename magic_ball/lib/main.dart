import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BallPage(),
  ));
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ask me anything",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: const Ball(),
      backgroundColor: Colors.blue,
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber=1;
  int noGenerator(){
    return ballNumber=Random().nextInt(4)+1;

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Expanded(
          child: TextButton(onPressed: () {
           setState(() {
             noGenerator();
           });
          },
          child: Image.asset('images/ball$ballNumber.png')),
        ),
      ),
    );
  }
}
