import 'package:equatable/equatable.dart';

abstract class ImageEvents extends Equatable{
const   ImageEvents();

@override
  List<Object> get props=>[];
}
class CameraCapture extends ImageEvents{}
class GalleryPicker extends ImageEvents{}