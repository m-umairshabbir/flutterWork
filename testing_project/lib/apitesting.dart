import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class TestingApi extends StatefulWidget {
  const TestingApi({super.key});

  @override
  State<TestingApi> createState() => _TestingApiState();
}

class _TestingApiState extends State<TestingApi> {
  double? latitude;
  double? longitude;
  late WeatherFactory wf;
  String apiKey = 'e6edabb33d6d608d12f6b14bdae0b1c2';
  Weather? currentWeather;


  @override
  void initState() {
    super.initState();
    wf = WeatherFactory(apiKey);
    getCurrentWeatherAndLocation();
  }
  void getCurrentWeatherAndLocation() async {
    try {
      Position position = await _determinePosition();
      latitude = position.latitude;
      longitude = position.longitude;
      await getWeather(latitude!, longitude!);
      setState(() {});  // Rebuild UI after weather data is fetched
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getWeather(double lat, double lon) async {
    try {
      Weather weather = await wf.currentWeatherByLocation(lat, lon);
      currentWeather = weather;


    } catch (e) {
      print("Error fetching weather Data: $e");
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        return Future.error('Permission Denied');
      }
    }
    return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          distanceFilter: 100,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:SpinKitCircle(
          color: Colors.green,


        ),
      ),
    );
  }
}
