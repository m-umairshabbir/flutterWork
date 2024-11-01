import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class LocationServiceProvider extends StatefulWidget {
  const LocationServiceProvider({super.key});

  @override
  State<LocationServiceProvider> createState() => _LocationServiceProviderState();
}

class _LocationServiceProviderState extends State<LocationServiceProvider> {
  void getLocation()async{
    LocationPermission permission=await Geolocator.checkPermission();
    if (permission==LocationPermission.denied || permission==LocationPermission.deniedForever){
      print("Permission denied by user ");
      LocationPermission ask=await Geolocator.requestPermission();
    }else
      {
        Position currentPosition=await Geolocator.getCurrentPosition(locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter:100,
        ));

        print("Longitude: ${currentPosition.longitude} Latitude: ${currentPosition.latitude}");
      }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("GeoLocator"),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              getLocation();
            },
            child: Text('Get-Location'),
          ),
        ),
      ),
    );
  }
}
