import 'package:weather/weather.dart';
import 'location_service.dart';
class WeatherService {
  final WeatherFactory _weatherFactory;

  WeatherService() : _weatherFactory = WeatherFactory("3bed251fb5365e9231111d3bc330a799");

  Future<Weather> getCurrentWeather(double latitude, double longitude) async {
    try {
      print("collecting weather info");
      Weather weather = await _weatherFactory.currentWeatherByLocation(latitude, longitude);
      return weather;
    } catch (e) {
      print("Error fetching weather data: $e");
      rethrow;
    }
  }
}
