import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerApp());
}
class ContainerApp extends StatelessWidget {
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Practice",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.teal
          ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white,Colors.grey,Colors.blueGrey],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
            ),
          ),
        ),

        body: Container(
          child: Image(image: AssetImage('images/illustration.png')),
          margin: EdgeInsets.all(40.0 ),

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.teal,
            boxShadow: [
              BoxShadow(
                color:Colors.black26.withOpacity(0.5),
                  spreadRadius:5,
                blurRadius: 10,
                offset:Offset(5,5)
              )
            ]
          ),
        ),

      ),
    );
  }
}
