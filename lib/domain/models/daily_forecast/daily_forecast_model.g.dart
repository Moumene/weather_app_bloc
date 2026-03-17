// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyForecastModel _$DailyForecastModelFromJson(Map<String, dynamic> json) =>
    _DailyForecastModel(
      date: _dateFromJson(json['date']),
      dayName: json['day_name'] as String,
      minTemp: (json['min_temp'] as num).toDouble(),
      maxTemp: (json['max_temp'] as num).toDouble(),
      iconCode: json['icon_code'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DailyForecastModelToJson(_DailyForecastModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'day_name': instance.dayName,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'icon_code': instance.iconCode,
      'description': instance.description,
    };
