import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';
import '../../core/errors/weather_failure.dart';
import '../../domain/models/forecast_model.dart';
import '../../domain/models/location_model.dart';
import '../../domain/models/weather_model.dart';

class WeatherRemoteDataSource {
  WeatherRemoteDataSource({
    http.Client? httpClient,
    String? baseUrl,
    String? apiKey,
  })  : _client = httpClient ?? http.Client(),
        _baseUrl = baseUrl ?? ApiConstants.baseUrl,
        _apiKey = apiKey ?? ApiConstants.apiKey;

  final http.Client _client;
  final String _baseUrl;
  final String _apiKey;

  Future<List<LocationModel>> searchLocations(String query) async {
    if (query.trim().isEmpty) return [];

    final uri = Uri.parse('$_baseUrl${ApiConstants.geoPath}/direct').replace(
      queryParameters: {
        'q': query,
        'limit': '5',
        'appid': _apiKey,
      },
    );

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw const WeatherFailureServer();
    }

    final list = jsonDecode(response.body) as List<dynamic>;
    return list
        .map((e) => LocationModel(
              name: e['name'] as String,
              lat: (e['lat'] as num).toDouble(),
              lon: (e['lon'] as num).toDouble(),
              country: e['country'] as String,
              state: e['state'] as String?,
            ))
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
      if (lang != null) 'lang': lang,
    };

    if (lat != null && lon != null) {
      params['lat'] = lat.toString();
      params['lon'] = lon.toString();
    } else if (cityName != null && cityName.isNotEmpty) {
      params['q'] = cityName;
    } else {
      throw const WeatherFailureNotFound();
    }

    final uri = Uri.parse('$_baseUrl${ApiConstants.dataPath}/weather')
        .replace(queryParameters: params);

    final response = await _client.get(uri);

    if (response.statusCode == 404) {
      throw const WeatherFailureNotFound();
    }
    if (response.statusCode != 200) {
      throw WeatherFailureServer(
        message: 'Status ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return _parseWeather(json);
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
      if (lang != null) 'lang': lang,
    };

    final uri = Uri.parse('$_baseUrl${ApiConstants.dataPath}/forecast')
        .replace(queryParameters: params);

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw WeatherFailureServer(
        message: 'Status ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final list = json['list'] as List<dynamic>? ?? [];
    return list.take(24).map((e) => _parseForecast(e as Map<String, dynamic>)).toList();
  }

  WeatherModel _parseWeather(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weather = (json['weather'] as List<dynamic>).first as Map<String, dynamic>;
    final wind = json['wind'] as Map<String, dynamic>? ?? {};
    final sys = json['sys'] as Map<String, dynamic>? ?? {};

    return WeatherModel(
      temperature: (main['temp'] as num).toDouble(),
      feelsLike: (main['feels_like'] as num).toDouble(),
      humidity: main['humidity'] as int? ?? 0,
      pressure: main['pressure'] as int? ?? 0,
      visibility: json['visibility'] as int? ?? 10000,
      windSpeed: (wind['speed'] as num?)?.toDouble() ?? 0,
      windDeg: wind['deg'] as int?,
      description: weather['description'] as String? ?? '',
      iconCode: weather['icon'] as String? ?? '01d',
      cityName: json['name'] as String? ?? '',
      countryCode: sys['country'] as String? ?? '',
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        (sys['sunrise'] as int?) ?? 0,
        isUtc: true,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(
        (sys['sunset'] as int?) ?? 0,
        isUtc: true,
      ),
    );
  }

  ForecastModel _parseForecast(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weather = (json['weather'] as List<dynamic>).first as Map<String, dynamic>;

    return ForecastModel(
      dateTime: DateTime.parse(json['dt_txt'] as String),
      temperature: (main['temp'] as num).toDouble(),
      feelsLike: (main['feels_like'] as num).toDouble(),
      humidity: main['humidity'] as int? ?? 0,
      description: weather['description'] as String? ?? '',
      iconCode: weather['icon'] as String? ?? '01d',
      pop: (json['pop'] as num?)?.toDouble() ?? 0,
    );
  }
}
