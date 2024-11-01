import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Bloc/PhotoBloc/photo_api_event.dart';
import 'package:news/Bloc/PhotoBloc/photo_api_state.dart';
import 'package:news/Models/PhotoModel/photo_model.dart';
import 'package:news/Repositories/PhotoApiRepo/photo_api_repo.dart';

class PhotoApiBloc extends Bloc<PhotoApiEvent,PhotoApiState>{
  List<PhotoModel> photoList=[];
  PhotoRepository photoRepository=PhotoRepository();
  PhotoApiBloc():super(const PhotoApiState()){
    on<PhotoFetch>(_photoFetch);
  }

  void _photoFetch(PhotoFetch event, Emitter<PhotoApiState> emit)async {
    photoList=await photoRepository.getPhoto();
    emit(state.copyWith(photoList: photoList));
  }
}