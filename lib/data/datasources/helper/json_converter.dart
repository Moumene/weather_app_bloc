/// Transforms OpenWeatherMap nested response to flat format for WeatherModel.fromJson.
Map<String, dynamic> toWeatherModelJson(Map<String, dynamic> json) {
  final main = json['main'] as Map<String, dynamic>? ?? {};
  final weatherList = json['weather'] as List<dynamic>? ?? [];
  final weather = weatherList.isNotEmpty
      ? weatherList.first as Map<String, dynamic>
      : <String, dynamic>{};
  final wind = json['wind'] as Map<String, dynamic>? ?? {};
  final sys = json['sys'] as Map<String, dynamic>? ?? {};

  final sunrise = sys['sunrise'] as int? ?? 0;
  final sunset = sys['sunset'] as int? ?? 0;

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
    'sunrise': DateTime.fromMillisecondsSinceEpoch(
      sunrise,
      isUtc: true,
    ).toIso8601String(),
    'sunset': DateTime.fromMillisecondsSinceEpoch(
      sunset,
      isUtc: true,
    ).toIso8601String(),
  };
}

Map<String, dynamic> toForecastModelJson(Map<String, dynamic> json) {
  final dt = json['dt_txt'] as String? ?? '';
  final main = json['main'] as Map<String, dynamic>? ?? {};
  final weatherList = json['weather'] as List<dynamic>? ?? [];
  final weather = weatherList.isNotEmpty
      ? weatherList.first as Map<String, dynamic>
      : <String, dynamic>{};
  final pop = json['pop'] as int? ?? 0;

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
