import 'dart:convert';

import 'package:news/Models/ComplexJsonModel/UserModel.dart';
import 'package:http/http.dart' as http;
class UserRepo{
  List<UserModel> userList=[];
  Future<List<UserModel>> fetchData()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    final data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i as Map<String,dynamic>));
      }
      return userList;
    }else{
      return userList;
    }
    
  }
}