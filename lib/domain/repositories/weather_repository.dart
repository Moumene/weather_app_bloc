import '../models/daily_forecast/daily_forecast_model.dart';
import '../models/forcast/forecast_model.dart';
import '../models/location/location_model.dart';
import '../models/weather/weather_model.dart';

abstract class WeatherRepository {
  Future<List<LocationModel>> searchLocations(String query);

  Future<WeatherModel> getCurrentWeather({
    double? lat,
    double? lon,
    String? cityName,
    String? countryCode,
    String? lang,
  });

  Future<List<ForecastModel>> getForecast({
    required double lat,
    required double lon,
    String? lang,
  });

  Future<List<DailyForecastModel>> getDailyForecast({
    required double lat,
    required double lon,
    String? lang,
  });
}
