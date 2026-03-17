part of 'weather_bloc.dart';

@freezed
sealed class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = WeatherInitial;
  const factory WeatherState.loading() = WeatherLoading;
  const factory WeatherState.loaded({
    required WeatherModel weather,
    required List<ForecastModel> forecast,
    required List<DailyForecastModel> dailyForecast,
    @Default(true) bool useCelsius,
  }) = WeatherLoaded;
  const factory WeatherState.error(WeatherFailure failure) = WeatherError;
}
