import 'package:flutter/material.dart';

void main() {
  runApp(MyApp() );
}

class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar:AppBar(
        title: Text('Soothing to beyond',textAlign: TextAlign.center,),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.teal,
          onPressed: () {  },
          foregroundColor: Colors.white,
        ),
    ),
    );
  }
}

