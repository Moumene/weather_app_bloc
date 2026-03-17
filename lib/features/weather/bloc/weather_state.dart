import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/errors/weather_failure.dart';
import '../../../domain/models/forecast_model.dart';
import '../../../domain/models/weather_model.dart';

part 'weather_state.freezed.dart';

@freezed
sealed class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = WeatherInitial;
  const factory WeatherState.loading() = WeatherLoading;
  const factory WeatherState.loaded({
    required WeatherModel weather,
    required List<ForecastModel> forecast,
    @Default(true) bool useCelsius,
  }) = WeatherLoaded;
  const factory WeatherState.error(WeatherFailure failure) = WeatherError;
}
