import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackBarPractice extends StatelessWidget {
  const SnackBarPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:  Text("Showing snackBar for 2 sec ",)
          ));

        }, child: const Text("SnackBar Show"),
        ),
      ),
    );
  }
}


