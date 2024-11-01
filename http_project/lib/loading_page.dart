import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/posts/1';
      var response = await http.get(Uri.parse(url));
      if(response.statusCode==200){
        String data=response.body;
        var userId=jsonDecode(data)['userId'];
        print('userId:${userId}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
