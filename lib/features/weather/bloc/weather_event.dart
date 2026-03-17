import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_event.freezed.dart';

@freezed
sealed class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.loadRequested() = WeatherLoadRequested;
  const factory WeatherEvent.refreshRequested() = WeatherRefreshRequested;
  const factory WeatherEvent.locationSelected({
    required double lat,
    required double lon,
    required String cityName,
  }) = WeatherLocationSelected;
  const factory WeatherEvent.unitsChanged({required bool useCelsius}) =
      WeatherUnitsChanged;
}
