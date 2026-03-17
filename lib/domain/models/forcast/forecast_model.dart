import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

@Freezed(copyWith: false)
abstract class ForecastModel with _$ForecastModel {
  const factory ForecastModel({
    @JsonKey(fromJson: _dateTimeFromJson) required DateTime dateTime,
    @JsonKey(name: 'temp') required double temperature,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'humidity') required int humidity,
    required String description,
    @JsonKey(name: 'icon_code') required String iconCode,
    @JsonKey(name: 'pop') required double pop,
  }) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
}

DateTime _dateTimeFromJson(dynamic value) {
  if (value == null) throw ArgumentError('Date is required');
  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value * 1000, isUtc: true);
  }
  return DateTime.parse(value as String);
}
