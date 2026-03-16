part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class WeatherLoadRequested extends WeatherEvent {
  const WeatherLoadRequested();
}

class WeatherRefreshRequested extends WeatherEvent {
  const WeatherRefreshRequested();
}

class WeatherLocationSelected extends WeatherEvent {
  const WeatherLocationSelected({
    required this.lat,
    required this.lon,
    required this.cityName,
  });

  final double lat;
  final double lon;
  final String cityName;

  @override
  List<Object?> get props => [lat, lon, cityName];
}

class WeatherUnitsChanged extends WeatherEvent {
  const WeatherUnitsChanged({required this.useCelsius});

  final bool useCelsius;

  @override
  List<Object?> get props => [useCelsius];
}
