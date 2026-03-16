import '../models/forecast_model.dart';
import '../models/location_model.dart';
import '../models/weather_model.dart';

abstract class WeatherRepository {
  Future<List<LocationModel>> searchLocations(String query);

  Future<WeatherModel> getCurrentWeather({
    double? lat,
    double? lon,
    String? cityName,
    String? lang,
  });

  Future<List<ForecastModel>> getForecast({
    required double lat,
    required double lon,
    String? lang,
  });
}
