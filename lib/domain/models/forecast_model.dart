import 'package:equatable/equatable.dart';

class ForecastModel extends Equatable {
  const ForecastModel({
    required this.dateTime,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.description,
    required this.iconCode,
    required this.pop,
  });

  final DateTime dateTime;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final String description;
  final String iconCode;
  final double pop;

  @override
  List<Object?> get props => [
        dateTime,
        temperature,
        feelsLike,
        humidity,
        description,
        iconCode,
        pop,
      ];
}
