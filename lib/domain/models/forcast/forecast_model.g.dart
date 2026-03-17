// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) =>
    _ForecastModel(
      dateTime: _dateTimeFromJson(json['dateTime']),
      temperature: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
      description: json['description'] as String,
      iconCode: json['icon_code'] as String,
      pop: (json['pop'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastModelToJson(_ForecastModel instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'humidity': instance.humidity,
      'description': instance.description,
      'icon_code': instance.iconCode,
      'pop': instance.pop,
    };
