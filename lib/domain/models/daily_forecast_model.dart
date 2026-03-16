import 'package:equatable/equatable.dart';

class DailyForecastModel extends Equatable {
  const DailyForecastModel({
    required this.date,
    required this.dayName,
    required this.minTemp,
    required this.maxTemp,
    required this.iconCode,
    required this.description,
  });

  final DateTime date;
  final String dayName;
  final double minTemp;
  final double maxTemp;
  final String iconCode;
  final String description;

  @override
  List<Object?> get props => [date, dayName, minTemp, maxTemp, iconCode, description];
}
