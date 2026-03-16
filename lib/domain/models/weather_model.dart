import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    this.visibility = 10000,
    required this.windSpeed,
    this.windDeg,
    required this.description,
    required this.iconCode,
    required this.cityName,
    required this.countryCode,
    required this.sunrise,
    required this.sunset,
  });

  final double temperature;
  final double feelsLike;
  final int humidity;
  final int pressure;
  final int? visibility;
  final double windSpeed;
  final int? windDeg;
  final String description;
  final String iconCode;
  final String cityName;
  final String countryCode;
  final DateTime sunrise;
  final DateTime sunset;

  @override
  List<Object?> get props => [
    temperature,
    feelsLike,
    humidity,
    pressure,
    visibility,
    windSpeed,
    windDeg,
    description,
    iconCode,
    cityName,
    countryCode,
    sunrise,
    sunset,
  ];
}
