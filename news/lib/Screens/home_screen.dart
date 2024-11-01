import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Rest API's"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context,'/2');
        }, child:const Text("Api Data")),
      ),
    );
  }
}
