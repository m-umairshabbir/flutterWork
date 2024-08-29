import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationServiceProvider extends StatefulWidget {
  const LocationServiceProvider({super.key});

  @override
  State<LocationServiceProvider> createState() => _LocationServiceProviderState();
}

class _LocationServiceProviderState extends State<LocationServiceProvider> {

  void getCurrentLocation()async {
    LocationPermission permissin=await Geolocator.checkPermission();
    if(permissin==LocationPermission.denied || permissin==LocationPermission.deniedForever){
      print("Location Denied");

      LocationPermission ask=await Geolocator.requestPermission();
    }else
      {
        Position currentPosition=await Geolocator.getCurrentPosition(
            locationSettings: LocationSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 100,
        ));
        
        print("Latitude=${currentPosition.latitude.toString()}");
        print("Longitude=${currentPosition.longitude.toString()}");
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          getCurrentLocation();
        }, child: Text('Get Location')),
      ),
    );
  }
}
