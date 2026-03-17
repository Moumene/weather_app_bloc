import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_forecast_model.freezed.dart';
part 'daily_forecast_model.g.dart';

@Freezed(copyWith: false)
abstract class DailyForecastModel with _$DailyForecastModel {
  const factory DailyForecastModel({
    @JsonKey(fromJson: _dateFromJson) required DateTime date,
    @JsonKey(name: 'day_name') required String dayName,
    @JsonKey(name: 'min_temp') required double minTemp,
    @JsonKey(name: 'max_temp') required double maxTemp,
    @JsonKey(name: 'icon_code') required String iconCode,
    required String description,
  }) = _DailyForecastModel;

  /// Parses JSON into [DailyForecastModel].
  /// Supports:
  /// - Flat format: { date/dt, day_name, min_temp, max_temp, icon_code, description }
  /// - OpenWeatherMap One Call daily: { dt, temp: {min, max}, weather: [{icon, description}] }
  factory DailyForecastModel.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastModelFromJson(json);
}

/// Handles date from either Unix epoch (int) or ISO 8601 string.
DateTime _dateFromJson(dynamic value) {
  if (value == null) throw ArgumentError('Date is required');
  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value * 1000, isUtc: true);
  }
  if (value is String) {
    return DateTime.parse(value);
  }
  throw ArgumentError('Date must be int (epoch) or String (ISO 8601)');
}
