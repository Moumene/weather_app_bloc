import 'package:flutter_dotenv/flutter_dotenv.dart';

/// API constants for OpenWeatherMap
/// Get your free API key at https://openweathermap.org/api
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.openweathermap.org';
  static const String dataPath = '/data/2.5';
  static const String geoPath = '/geo/1.0';

  /// API key from .env (OPENWEATHER_API_KEY) or --dart-define=OPENWEATHER_API_KEY
  static String get apiKey {
    if (dotenv.isInitialized) {
      final fromEnv = dotenv.env['OPENWEATHER_API_KEY'];
      if (fromEnv != null && fromEnv.isNotEmpty) return fromEnv;
    }
    return const String.fromEnvironment(
      'OPENWEATHER_API_KEY',
      defaultValue: '',
    );
  }
}
