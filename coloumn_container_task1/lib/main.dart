import 'package:flutter/material.dart';

void main() {
  runApp( TaskColumn());
}
class TaskColumn extends StatelessWidget {
  const TaskColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: double.infinity,
                  width: 100,
                  color: Colors.red,
                  child: Text("hello"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("centre"),
                      color: Colors.yellow,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      child: Text("centre"),
                      color: Colors.green,
                      height: 100,
                      width: 100,
                    )
                  ],
                ),
                Container(
                  height: double.infinity,
                  width: 100,
                  color: Colors.blue,
                  child: Text("World"),

                )
                
              ],
           ),
        ),
      ),
    );
  }
}
