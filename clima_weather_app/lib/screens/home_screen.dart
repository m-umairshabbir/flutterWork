import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clima_weather_app/services/location_service.dart';
import 'package:clima_weather_app/services/weather_service.dart';
import 'package:weather/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart'; // For date and time formatting

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationService _locationService = LocationService();
  final WeatherService _weatherService = WeatherService();

  double? _latitude;
  double? _longitude;
  Weather? _weather;
  bool _isLoading = true; // Added loading state

  @override
  void initState() {
    super.initState();
    _initializeWeather();
    timeMessage();
  }

  Future<void> _initializeWeather() async {
    await _locationService.getCurrentLocation();
    setState(() {
      _latitude = _locationService.latitude;
      _longitude = _locationService.longitude;
    });

    if (_latitude != null && _longitude != null) {
      try {
        _weather = await _weatherService.getCurrentWeather(_latitude!, _longitude!);
      } catch (e) {
        print("Error fetching weather data: $e");
      } finally {
        setState(() {
          _isLoading = false; // Set loading state to false
        });
      }
    } else {
      setState(() {
        _isLoading = false; // Set loading state to false if location is not available
      });
    }
  }

  Future<void> _refreshWeather() async {
    setState(() {
      _isLoading = true; // Set loading state to true while refreshing
    });
    await _initializeWeather();
  }

  String _getWeatherImage() {
    if (_weather == null) return 'images/5.png'; // Fallback image

    switch (_weather!.weatherConditionCode) {
      case 200: // Thunderstorm with light rain
      case 201: // Thunderstorm with rain
      case 202: // Thunderstorm with heavy rain
        return 'images/1.png';
      case 300: // Light drizzle
      case 301: // Drizzle
      case 302: // Heavy drizzle
        return 'images/3.png';
      case 500: // Light rain
      case 501: // Moderate rain
      case 502: // Heavy rain
        return 'images/2.png';
      case 600: // Light snow
      case 601: // Snow
        return 'images/4.png';
      case 602: // Heavy snow
        return 'images/5.png';
      case 800: // Clear sky
        return 'images/6.png';
      case 801: // Few clouds
        return 'images/8.png';
      case 802: // Scattered clouds
      case 803: // Broken clouds
      case 804: // Overcast clouds
        return 'images/7.png';
      default:
        return 'images/9.png'; // Default image for unknown codes
    }
  }


  // Determine the time of day
   String? timeOfDayMessage;
  void timeMessage(){
    final now = DateTime.now();
    final hour = now.hour;
    setState(() {
      if (hour < 12) {
        timeOfDayMessage = 'Good Morning!';
      } else if (hour < 18) {
        timeOfDayMessage = 'Good Afternoon!';
      } else if (hour < 21) {
        timeOfDayMessage = 'Good Evening!';
      } else {
        timeOfDayMessage = 'Good Night!';
      }
    });



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: RefreshIndicator(
        color: const Color(0xffffab40),
        onRefresh: _refreshWeather,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 1.2, kToolbarHeight, 40),
            child: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: _isLoading
                    ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 250),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpinKitFadingCube(color: Colors.blue),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Fetching Weather Data',
                          style: TextStyle(
                            color: Color(0xffffab40),
                            fontFamily: 'ConcertOne',
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    : Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-3, -0.3),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade100,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(3, -0.3),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade100,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, -1.2),
                      child: Container(
                        height: 300,
                        width: 600,
                        decoration: const BoxDecoration(
                          color: Color(0xffffab40),
                        ),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📍${_locationService.locationName ?? 'Unknown'}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 8),
                           Text(timeOfDayMessage ?? 'Hello!',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(_getWeatherImage()),
                          Center(
                            child: Text(
                              _weather != null ? '${_weather!.temperature!.celsius!.toStringAsFixed(1)} °C' : '0.0 °C',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 55,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              _weather?.weatherDescription ?? 'Weather Description',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              _getFormattedDateTime(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('images/11.png', scale: 8),
                                  const SizedBox(height: 5),
                                  Column(
                                    children: [
                                      const Text(
                                        'Sunrise',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        _weather?.sunrise?.toLocal().toString().split(' ')[1] ?? '5:34 am',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('images/12.png', scale: 8),
                                  const SizedBox(height: 5),
                                  Column(
                                    children: [
                                      const Text(
                                        'Sunset',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        _weather?.sunset?.toLocal().toString().split(' ')[1] ?? '6:47 pm',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(color: Colors.grey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('images/14.png', scale: 8),
                                  const SizedBox(height: 5),
                                  Column(
                                    children: [
                                      const Text(
                                        'Temp Min',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        '${_weather?.tempMin?.celsius?.toStringAsFixed(1) ?? '0.0'} °C',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('images/13.png', scale: 8),
                                  const SizedBox(height: 5),
                                  Column(
                                    children: [
                                      const Text(
                                        'Temp Max',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        '${_weather?.tempMax?.celsius?.toStringAsFixed(1) ?? '0.0'} °C',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getFormattedDateTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat('EEEE, MMMM d, yyyy');
    final timeFormat = DateFormat('h:mm a');
    return '${dateFormat.format(now)}\n${timeFormat.format(now)}';
  }
}
