import 'dart:convert';

import 'package:news/Models/PhotoModel/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoRepository{
  List<PhotoModel> photoList=[];
  Future<List<PhotoModel>> getPhoto()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    final data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        PhotoModel photo=PhotoModel(title: i['title'], url: i['url'], id: i['id']);
        photoList.add(photo);
      }
      return photoList;
    }else{
      return photoList;
    }
  }
}