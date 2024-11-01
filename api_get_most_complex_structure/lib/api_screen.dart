import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  Future register(String email,password)async{

      Response response=await post(Uri.parse("https://reqres.in/api/register"),
          body:{
            'email':email,
            'password':password,
          });
      try{
        final data=jsonDecode(response.body.toString());
        if(response.statusCode==200){
          print("Registered Successfully");
          print(data['token']);
        }
    }catch(e){
      print("failed");
      }

  }
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    contentPadding: const EdgeInsets.all(20),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    )
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                    labelText: "Password",
                    contentPadding: const EdgeInsets.all(20),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    )
                ),

              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                register(emailController.text.toString(), passController.text.toString());
              },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white
                ),
                child:const Text("Sign up",
                ),
              )
            ],
          ),
        )
    );

  }
}
