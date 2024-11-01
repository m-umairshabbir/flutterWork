import 'package:firebase_auth/firebase_auth.dart';
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
        title: const Text("Project"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
            Navigator.popUntil(context, (route)=>route.isFirst);
            Navigator.pushReplacementNamed(context, "SignIn");

          }, icon: Icon(Icons.exit_to_app,color: Colors.grey,))
        ],
      ),
      backgroundColor: Colors.grey,
      body: const Center(
        child: Text("Welcome to Home Screen",style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
