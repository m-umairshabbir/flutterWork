import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get_http_bloc_project/Models/posts_model/post-model.dart';
class PostRepository{
  Future<List<PostModel>> fetchPost()async{
    try{
      final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
          if(response.statusCode==200){
            final body =jsonDecode(response.body) as List;
            return body.map((e){
              return PostModel(
                id:e['id'] as int,
                postId:e['postId'] as int,
                email: e['email'] as String,
                body: e['body'] as String,
              );
            }).toList();
          }
    }on SocketException{
      throw Exception('errors while fetching data');
    }on TimeoutException{
      throw Exception('errors while fetching data');
    }
    throw Exception('errors while fetching data');
  }
}