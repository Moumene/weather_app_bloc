part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({
    required this.weather,
    required this.forecast,
    this.useCelsius = true,
  });

  final WeatherModel weather;
  final List<ForecastModel> forecast;
  final bool useCelsius;

  @override
  List<Object?> get props => [weather, forecast, useCelsius];
}

class WeatherError extends WeatherState {
  const WeatherError(this.failure);

  final WeatherFailure failure;

  @override
  List<Object?> get props => [failure];
}
