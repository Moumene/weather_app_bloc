part of 'weather_bloc.dart';

@freezed
sealed class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.loadRequested() = WeatherLoadRequested;
  const factory WeatherEvent.refreshRequested() = WeatherRefreshRequested;
  const factory WeatherEvent.locationSelected({
    required double lat,
    required double lon,
    required String cityName,
    String? countryCode,
  }) = WeatherLocationSelected;
  const factory WeatherEvent.unitsChanged({required bool useCelsius}) =
      WeatherUnitsChanged;
}
