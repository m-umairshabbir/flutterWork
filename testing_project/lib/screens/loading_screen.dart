import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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

      print (currentWeather!);
      print('Area: ${weather.areaName}');
      print('Temperature: ${weather.temperature?.celsius}');
      print('Description: ${weather.weatherDescription}');
      print('Country: ${weather.country}');
      setState(() {});
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: currentWeather != null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Location: ${currentWeather!.areaName}, ${currentWeather!.country}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Temperature: ${currentWeather!.temperature?.celsius?.toStringAsFixed(1)}°C',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Description: ${currentWeather!.weatherDescription}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Latitude: $latitude, \nLongitude: $longitude',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
              : CircularProgressIndicator(),  // Loading indicator while fetching data
        ),
      ),
    );
  }
}
