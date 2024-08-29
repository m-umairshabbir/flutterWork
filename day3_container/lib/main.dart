import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text("Flutter Container",),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.red,Colors.pink,Colors.black26], // Gradient colors
                begin: Alignment.topLeft, // Starting point of the gradient
                end: Alignment.bottomRight, // Ending point of the gradient
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              // color: Colors.lightBlueAccent,
              //
              width:200.0,
              height: 200.0,
              padding: EdgeInsets.fromLTRB(35, 85, 30, 10),
              child: Text("Hello flutter Dev's" ,textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,

                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.red], // Gradient colors
                  begin: Alignment.topLeft, // Starting point of the gradient
                  end: Alignment.bottomRight, // Ending point of the gradient
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // How far the shadow spreads
                    blurRadius: 10,  // How blurry the shadow is
                    offset: Offset(5, 5), // Offset in x and y directions
                  ),
                ],
              )
            ),
          ),
        )
      ),
    );
  }
}

