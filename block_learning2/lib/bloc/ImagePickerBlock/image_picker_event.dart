
import 'package:equatable/equatable.dart';

abstract class ImageEvents extends Equatable{

  const ImageEvents();

  @override
  List<Object?> get props => [];
}


class CameraImageCapture extends ImageEvents{}
class GalleryImagePicker extends ImageEvents{}