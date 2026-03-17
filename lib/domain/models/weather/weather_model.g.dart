// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    _WeatherModel(
      temperature: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
      pressure: (json['pressure'] as num).toInt(),
      visibility: (json['visibility'] as num?)?.toInt(),
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDeg: (json['wind_deg'] as num?)?.toInt(),
      description: json['description'] as String,
      iconCode: json['icon_code'] as String,
      cityName: json['city_name'] as String,
      countryCode: json['country_code'] as String,
      sunrise: json['sunrise'] == null
          ? null
          : DateTime.parse(json['sunrise'] as String),
      sunset: json['sunset'] == null
          ? null
          : DateTime.parse(json['sunset'] as String),
      timezoneOffset: (json['timezone_offset'] as num?)?.toInt(),
      uvi: (json['uvi'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherModelToJson(_WeatherModel instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'description': instance.description,
      'icon_code': instance.iconCode,
      'city_name': instance.cityName,
      'country_code': instance.countryCode,
      'sunrise': instance.sunrise?.toIso8601String(),
      'sunset': instance.sunset?.toIso8601String(),
      'timezone_offset': instance.timezoneOffset,
      'uvi': instance.uvi,
    };
