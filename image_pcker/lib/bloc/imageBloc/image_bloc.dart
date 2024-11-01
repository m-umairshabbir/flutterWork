import 'package:bloc/bloc.dart';
import 'package:image_pcker/bloc/imageBloc/image_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/image_picker_utils.dart';
import 'image_event.dart';

class ImageBloc extends Bloc<ImageEvents, ImageState> {
  final ImagePickerUtils imagePickerUtils;
  ImageBloc(this.imagePickerUtils) : super(const ImageState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_gallery);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImageState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _gallery(GalleryPicker event, Emitter<ImageState> emit) async {
    XFile? file = await imagePickerUtils.galleryImagePicker();
    emit(state.copyWith(file: file));
  }
}
