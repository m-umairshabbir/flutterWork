import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    try {
      final XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);
      return file;
    } catch (e) {
      print("Error capturing image from camera: $e");
      return null;
    }
  }

  Future<XFile?> galleryImagePicker() async {
    try {
      final XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
      return file;
    } catch (e) {
      print("Error picking image from gallery: $e");
      return null;
    }
  }
}
