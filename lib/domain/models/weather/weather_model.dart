import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@Freezed(copyWith: false)
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @JsonKey(name: 'temp') required double temperature,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'humidity') required int humidity,
    @JsonKey(name: 'pressure') required int pressure,
    @JsonKey(name: 'visibility') required int? visibility,
    @JsonKey(name: 'wind_speed') required double windSpeed,
    @JsonKey(name: 'wind_deg') required int? windDeg,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'icon_code') required String iconCode,
    @JsonKey(name: 'city_name') required String cityName,
    @JsonKey(name: 'country_code') required String countryCode,
    @JsonKey(name: 'sunrise') required DateTime sunrise,
    @JsonKey(name: 'sunset') required DateTime sunset,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
