import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_bloc/data/datasources/helper/json_converter.dart';

import '../../core/constants/api_constants.dart';
import '../../core/errors/weather_failure.dart';
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
    String? lang,
  }) async {
    final params = <String, String>{
      'appid': _apiKey,
      'units': 'metric',
      'lang': ?lang,
    };

    if (lat != null && lon != null) {
      params['lat'] = lat.toString();
      params['lon'] = lon.toString();
    } else if (cityName != null && cityName.isNotEmpty) {
      params['q'] = cityName;
    } else {
      throw const WeatherFailureNotFound();
    }

    final uri = Uri.parse(
      '$_baseUrl${ApiConstants.dataPath}/weather',
    ).replace(queryParameters: params);

    final response = await _client.get(uri);

    if (response.statusCode == 404) {
      throw const WeatherFailureNotFound();
    }
    if (response.statusCode != 200) {
      throw WeatherFailureServer(message: 'Status ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return WeatherModel.fromJson(toWeatherModelJson(json));
  }

  Future<List<ForecastModel>> getForecast({
    required double lat,
    required double lon,
    String? lang,
  }) async {
    final params = <String, String>{
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': _apiKey,
      'units': 'metric',
      'lang': ?lang,
    };

    final uri = Uri.parse(
      '$_baseUrl${ApiConstants.dataPath}/forecast',
    ).replace(queryParameters: params);

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw WeatherFailureServer(message: 'Status ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final list = json['list'] as List<dynamic>? ?? [];
    return list
        .take(24)
        .map(
          (e) => ForecastModel.fromJson(
            toForecastModelJson(e as Map<String, dynamic>),
          ),
        )
        .toList();
  }
}
