import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_learning2/Utils/image_picker_utils.dart';
import 'package:block_learning2/bloc/ImagePickerBlock/image_picker_event.dart';
import 'package:block_learning2/bloc/ImagePickerBlock/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

class ImageBloc extends Bloc<ImageEvents, ImageState> {
  final ImagePickerUtils imagePickerUtils;
  ImageBloc(this.imagePickerUtils) : super(const ImageState()) {
    on<CameraImageCapture>(cameraCapture);
  }

  void cameraCapture(CameraImageCapture event, Emitter<ImageState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _gallery(CameraImageCapture event, Emitter<ImageState> emit) async {
    XFile? file = await imagePickerUtils.galleryImagePicker();
    emit(state.copyWith(file: file));
  }
}
