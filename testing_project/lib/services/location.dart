import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
class Location {
  late double latitude, longitude;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        LocationPermission ask = await Geolocator.requestPermission();
      } else {
        Position position = await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.low, distanceFilter: 100));
        latitude = position.latitude;
        longitude = position.longitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
