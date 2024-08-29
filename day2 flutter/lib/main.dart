import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(

      appBar: AppBar(
        title: const Text('Asset Data + Yaml',textAlign: TextAlign.center,),
        backgroundColor: (Colors.brown),
        foregroundColor: (Colors.white),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/rabit.png'),
        )
      ),
    ),

  ));
}


