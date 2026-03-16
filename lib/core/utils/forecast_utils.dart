import 'package:intl/intl.dart';

import '../../domain/models/forecast_model.dart';
import '../../domain/models/daily_forecast_model.dart';

/// Groups hourly forecast into daily forecasts (min/max per day)
List<DailyForecastModel> groupForecastByDay(List<ForecastModel> forecast) {
  if (forecast.isEmpty) return [];

  final byDate = <DateTime, List<ForecastModel>>{};
  for (final f in forecast) {
    final date = DateTime(f.dateTime.year, f.dateTime.month, f.dateTime.day);
    byDate.putIfAbsent(date, () => []).add(f);
  }

  final days = byDate.keys.toList()..sort();
  return days.take(5).map((date) {
    final items = byDate[date]!;
    final temps = items.map((e) => e.temperature).toList();
    final min = temps.reduce((a, b) => a < b ? a : b);
    final max = temps.reduce((a, b) => a > b ? a : b);
    final mid = items[items.length ~/ 2];
    return DailyForecastModel(
      date: date,
      dayName: _formatDayName(date),
      minTemp: min,
      maxTemp: max,
      iconCode: mid.iconCode,
      description: mid.description,
    );
  }).toList();
}

String _formatDayName(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final d = DateTime(date.year, date.month, date.day);
  if (d == today) return 'Today';
  return DateFormat('EEE').format(date);
}
