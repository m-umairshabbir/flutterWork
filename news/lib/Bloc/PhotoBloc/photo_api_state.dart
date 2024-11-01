import 'package:equatable/equatable.dart';
import 'package:news/Models/PhotoModel/photo_model.dart';

class PhotoApiState extends Equatable{

  final List<PhotoModel> photoList;

  const PhotoApiState({this.photoList=const []});



  PhotoApiState copyWith ({List<PhotoModel>? photoList}){
    return  PhotoApiState(
      photoList: photoList ?? this.photoList,
    );
  }







  @override
  List<Object?> get props => [photoList];

}