import 'package:intl/intl.dart';

/// Transforms OpenWeatherMap nested response (2.5 weather API) to flat format for WeatherModel.fromJson.
Map<String, dynamic> toWeatherModelJson(Map<String, dynamic> json) {
  final main = json['main'] as Map<String, dynamic>? ?? {};
  final weatherList = json['weather'] as List<dynamic>? ?? [];
  final weather = weatherList.isNotEmpty
      ? weatherList.first as Map<String, dynamic>
      : <String, dynamic>{};
  final wind = json['wind'] as Map<String, dynamic>? ?? {};
  final sys = json['sys'] as Map<String, dynamic>? ?? {};

  final sunriseTs = sys['sunrise'] as int?;
  final sunsetTs = sys['sunset'] as int?;

  return {
    'temp': main['temp'],
    'feels_like': main['feels_like'],
    'humidity': main['humidity'] ?? 0,
    'pressure': main['pressure'] ?? 0,
    'visibility': json['visibility'] ?? 10000,
    'wind_speed': wind['speed'] ?? 0,
    'wind_deg': wind['deg'],
    'description': weather['description'] ?? '',
    'icon_code': weather['icon'] ?? '01d',
    'city_name': json['name'] ?? '',
    'country_code': sys['country'] ?? '',
    if (sunriseTs != null)
      'sunrise': DateTime.fromMillisecondsSinceEpoch(
        sunriseTs * 1000,
        isUtc: true,
      ).toIso8601String(),
    if (sunsetTs != null)
      'sunset': DateTime.fromMillisecondsSinceEpoch(
        sunsetTs * 1000,
        isUtc: true,
      ).toIso8601String(),
    'uvi': null,
  };
}

/// Transforms One Call API 3.0 current object to flat format for WeatherModel.fromJson.
Map<String, dynamic> toWeatherModelJsonFromOneCall(
  Map<String, dynamic> current, {
  String cityName = '',
  String countryCode = '',
  int? timezoneOffset,
}) {
  final weatherList = current['weather'] as List<dynamic>? ?? [];
  final weather = weatherList.isNotEmpty
      ? weatherList.first as Map<String, dynamic>
      : <String, dynamic>{};
  final sunriseTs = current['sunrise'] as int?;
  final sunsetTs = current['sunset'] as int?;

  return {
    'temp': current['temp'],
    'feels_like': current['feels_like'],
    'humidity': current['humidity'] ?? 0,
    'pressure': current['pressure'] ?? 0,
    'visibility': current['visibility'] ?? 10000,
    'wind_speed': current['wind_speed'] ?? 0,
    'wind_deg': current['wind_deg'],
    'description': weather['description'] ?? '',
    'icon_code': weather['icon'] ?? '01d',
    'city_name': cityName,
    'country_code': countryCode,
    if (sunriseTs != null)
      'sunrise': DateTime.fromMillisecondsSinceEpoch(
        sunriseTs * 1000,
        isUtc: true,
      ).toIso8601String(),
    if (sunsetTs != null)
      'sunset': DateTime.fromMillisecondsSinceEpoch(
        sunsetTs * 1000,
        isUtc: true,
      ).toIso8601String(),
    if (timezoneOffset != null) 'timezone_offset': timezoneOffset,
    'uvi': current['uvi'],
  };
}

/// Transforms OpenWeatherMap 2.5 forecast API list item.
Map<String, dynamic> toForecastModelJson(Map<String, dynamic> json) {
  final dt = json['dt_txt'] as String? ?? '';
  final main = json['main'] as Map<String, dynamic>? ?? {};
  final weatherList = json['weather'] as List<dynamic>? ?? [];
  final weather = weatherList.isNotEmpty
      ? weatherList.first as Map<String, dynamic>
      : <String, dynamic>{};
  final pop = (json['pop'] as num?)?.toDouble() ?? 0.0;

  return {
    'dateTime': dt,
    'temp': main['temp'],
    'feels_like': main['feels_like'],
    'humidity': main['humidity'] ?? 0,
    'description': weather['description'] ?? '',
    'icon_code': weather['icon'] ?? '01d',
    'pop': pop,
  };
}

/// Transforms One Call API 3.0 daily item to format for DailyForecastModel.fromJson.
Map<String, dynamic> toDailyForecastModelJsonFromOneCall(
  Map<String, dynamic> json, {
  int? timezoneOffset,
}) {
  final weatherList = json['weather'] as List<dynamic>? ?? [];
  final weather = weatherList.isNotEmpty
      ? weatherList.first as Map<String, dynamic>
      : <String, dynamic>{};
  final temp = json['temp'] as Map<String, dynamic>? ?? {};
  final dt = json['dt'] as int?;
  if (dt == null) throw ArgumentError('Daily forecast dt is required');

  final utcDate = DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: true);
  final localDate = timezoneOffset != null
      ? utcDate.add(Duration(seconds: timezoneOffset))
      : utcDate;
  final dayName = _formatDailyDayName(localDate);

  return {
    'date': dt,
    'day_name': dayName,
    'min_temp': (temp['min'] as num?)?.toDouble() ?? 0.0,
    'max_temp': (temp['max'] as num?)?.toDouble() ?? 0.0,
    'icon_code': weather['icon'] ?? '01d',
    'description': weather['description'] ?? '',
  };
}

String _formatDailyDayName(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final d = DateTime(date.year, date.month, date.day);
  if (d == today) return 'Today';
  return DateFormat('EEE').format(date);
}

/// Transforms One Call API 3.0 hourly item to format for ForecastModel.fromJson.
Map<String, dynamic> toForecastModelJsonFromOneCall(Map<String, dynamic> json) {
  final weatherList = json['weather'] as List<dynamic>? ?? [];
  final weather = weatherList.isNotEmpty
      ? weatherList.first as Map<String, dynamic>
      : <String, dynamic>{};
  final pop = (json['pop'] as num?)?.toDouble() ?? 0.0;

  return {
    'dateTime': json['dt'],
    'temp': json['temp'],
    'feels_like': json['feels_like'],
    'humidity': json['humidity'] ?? 0,
    'description': weather['description'] ?? '',
    'icon_code': weather['icon'] ?? '01d',
    'pop': pop,
  };
}
