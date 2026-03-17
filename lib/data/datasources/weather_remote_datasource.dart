import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_bloc/data/datasources/helper/json_converter.dart';

import '../../core/constants/api_constants.dart';
import '../../core/errors/weather_failure.dart';
import '../../domain/models/daily_forecast/daily_forecast_model.dart';
import '../../domain/models/forcast/forecast_model.dart';
import '../../domain/models/location/location_model.dart';
import '../../domain/models/weather/weather_model.dart';

class WeatherRemoteDataSource {
  WeatherRemoteDataSource({
    http.Client? httpClient,
    String? baseUrl,
    String? apiKey,
  }) : _client = httpClient ?? http.Client(),
       _baseUrl = baseUrl ?? ApiConstants.baseUrl,
       _apiKey = apiKey ?? ApiConstants.apiKey;

  final http.Client _client;
  final String _baseUrl;
  final String _apiKey;

  Map<String, dynamic>? _oneCallCache;
  double? _cacheLat;
  double? _cacheLon;

  Future<List<LocationModel>> searchLocations(String query) async {
    if (query.trim().isEmpty) return [];

    final uri = Uri.parse(
      '$_baseUrl${ApiConstants.geoPath}/direct',
    ).replace(queryParameters: {'q': query, 'limit': '5', 'appid': _apiKey});

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw const WeatherFailureServer();
    }

    final list = jsonDecode(response.body) as List<dynamic>;
    return list
        .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<WeatherModel> getCurrentWeather({
    double? lat,
    double? lon,
    String? cityName,
    String? countryCode,
    String? lang,
  }) async {
    if (lat == null || lon == null) {
      if (cityName != null && cityName.isNotEmpty) {
        final locations = await searchLocations(cityName);
        if (locations.isEmpty) throw const WeatherFailureNotFound();
        final loc = locations.first;
        lat = loc.lat;
        lon = loc.lon;
        cityName = loc.name;
        countryCode = loc.country;
      } else {
        throw const WeatherFailureNotFound();
      }
    }

    final params = <String, String>{
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': _apiKey,
      'units': 'metric',
      if (lang != null) 'lang': lang,
    };

    final uri = Uri.parse(
      '$_baseUrl${ApiConstants.oneCallPath}',
    ).replace(queryParameters: params);

    final response = await _client.get(uri);

    if (response.statusCode == 404) {
      throw const WeatherFailureNotFound();
    }
    if (response.statusCode != 200) {
      throw WeatherFailureServer(message: 'Status ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    _oneCallCache = json;
    _cacheLat = lat;
    _cacheLon = lon;

    final current = json['current'] as Map<String, dynamic>? ?? {};
    final timezoneOffset = json['timezone_offset'] as int?;
    return WeatherModel.fromJson(
      toWeatherModelJsonFromOneCall(
        current,
        cityName: cityName ?? '',
        countryCode: countryCode ?? '',
        timezoneOffset: timezoneOffset,
      ),
    );
  }

  Future<List<ForecastModel>> getForecast({
    required double lat,
    required double lon,
    String? lang,
  }) async {
    Map<String, dynamic>? json = _oneCallCache;
    if (json == null || _cacheLat != lat || _cacheLon != lon) {
      final params = <String, String>{
        'lat': lat.toString(),
        'lon': lon.toString(),
        'appid': _apiKey,
        'units': 'metric',
        if (lang != null) 'lang': lang,
      };

      final uri = Uri.parse(
        '$_baseUrl${ApiConstants.oneCallPath}',
      ).replace(queryParameters: params);

      final response = await _client.get(uri);

      if (response.statusCode != 200) {
        throw WeatherFailureServer(message: 'Status ${response.statusCode}');
      }

      json = jsonDecode(response.body) as Map<String, dynamic>;
    }

    final hourly = json['hourly'] as List<dynamic>? ?? [];
    return hourly
        .take(24)
        .map(
          (e) => ForecastModel.fromJson(
            toForecastModelJsonFromOneCall(e as Map<String, dynamic>),
          ),
        )
        .toList();
  }

  Future<List<DailyForecastModel>> getDailyForecast({
    required double lat,
    required double lon,
    String? lang,
  }) async {
    Map<String, dynamic>? json = _oneCallCache;
    if (json == null || _cacheLat != lat || _cacheLon != lon) {
      final params = <String, String>{
        'lat': lat.toString(),
        'lon': lon.toString(),
        'appid': _apiKey,
        'units': 'metric',
        if (lang != null) 'lang': lang,
      };

      final uri = Uri.parse(
        '$_baseUrl${ApiConstants.oneCallPath}',
      ).replace(queryParameters: params);

      final response = await _client.get(uri);

      if (response.statusCode != 200) {
        throw WeatherFailureServer(message: 'Status ${response.statusCode}');
      }

      json = jsonDecode(response.body) as Map<String, dynamic>;
    }

    final daily = json['daily'] as List<dynamic>? ?? [];
    final timezoneOffset = json['timezone_offset'] as int?;
    return daily
        .take(8)
        .map(
          (e) => DailyForecastModel.fromJson(
            toDailyForecastModelJsonFromOneCall(
              e as Map<String, dynamic>,
              timezoneOffset: timezoneOffset,
            ),
          ),
        )
        .toList();
  }
}
