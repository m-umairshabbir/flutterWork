import 'dart:convert';

import 'package:news/Models/PostModel/post_model.dart';
import 'package:http/http.dart' as http;
class PostRepository{
  List<PostModel> postList=[];
  Future<List <PostModel>> fetchApiData()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    final data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      postList.clear();
      for(Map i in data){
        postList.add(PostModel.fromJson(i as Map<String,dynamic>));
      }
      return postList;
    }else{
      return postList;
    }
  }
}