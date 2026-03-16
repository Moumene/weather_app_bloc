import '../../core/errors/weather_failure.dart';
import '../../domain/models/forecast_model.dart';
import '../../domain/models/location_model.dart';
import '../../domain/models/weather_model.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    WeatherRemoteDataSource? remoteDataSource,
  }) : _remote = remoteDataSource ?? WeatherRemoteDataSource();

  final WeatherRemoteDataSource _remote;

  @override
  Future<List<LocationModel>> searchLocations(String query) async {
    try {
      return await _remote.searchLocations(query);
    } catch (e) {
      if (e is WeatherFailure) rethrow;
      throw const WeatherFailureNetwork();
    }
  }

  @override
  Future<WeatherModel> getCurrentWeather({
    double? lat,
    double? lon,
    String? cityName,
    String? lang,
  }) async {
    try {
      return await _remote.getCurrentWeather(
        lat: lat,
        lon: lon,
        cityName: cityName,
        lang: lang,
      );
    } on WeatherFailure {
      rethrow;
    } catch (e) {
      throw const WeatherFailureNetwork();
    }
  }

  @override
  Future<List<ForecastModel>> getForecast({
    required double lat,
    required double lon,
    String? lang,
  }) async {
    try {
      return await _remote.getForecast(
        lat: lat,
        lon: lon,
        lang: lang,
      );
    } on WeatherFailure {
      rethrow;
    } catch (e) {
      throw const WeatherFailureNetwork();
    }
  }
}
