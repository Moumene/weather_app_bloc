import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/weather_failure.dart';
import '../../../domain/models/forecast_model.dart';
import '../../../domain/models/weather_model.dart';
import '../../../domain/repositories/weather_repository.dart';
import '../../../domain/repositories/settings_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required WeatherRepository weatherRepository,
    required SettingsRepository settingsRepository,
  })  : _weatherRepo = weatherRepository,
        _settingsRepo = settingsRepository,
        super(const WeatherInitial()) {
    on<WeatherLoadRequested>(_onLoadRequested);
    on<WeatherRefreshRequested>(_onRefreshRequested);
    on<WeatherLocationSelected>(_onLocationSelected);
    on<WeatherUnitsChanged>(_onUnitsChanged);
  }

  final WeatherRepository _weatherRepo;
  final SettingsRepository _settingsRepo;

  double? _lastLat;
  double? _lastLon;
  String? _lastCityName;

  Future<void> _onLoadRequested(
    WeatherLoadRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherLoading());

    try {
      final lang = await _settingsRepo.getLanguageCode();
      final langParam = _toOpenWeatherLang(lang);

      double? lat = _lastLat;
      double? lon = _lastLon;
      String? cityName = _lastCityName;

      if (lat == null || lon == null) {
        lat = await _settingsRepo.getLastLat();
        lon = await _settingsRepo.getLastLon();
        cityName = await _settingsRepo.getLastCityName();
        _lastLat = lat;
        _lastLon = lon;
        _lastCityName = cityName;
      }

      WeatherModel? weather;
      List<ForecastModel> forecast = [];

      if (lat != null && lon != null) {
        weather = await _weatherRepo.getCurrentWeather(
          lat: lat,
          lon: lon,
          lang: langParam,
        );
        forecast = await _weatherRepo.getForecast(
          lat: lat,
          lon: lon,
          lang: langParam,
        );
      } else if (cityName != null && cityName.isNotEmpty) {
        final locations = await _weatherRepo.searchLocations(cityName);
        if (locations.isNotEmpty) {
          final loc = locations.first;
          _lastLat = loc.lat;
          _lastLon = loc.lon;
          weather = await _weatherRepo.getCurrentWeather(
            lat: loc.lat,
            lon: loc.lon,
            lang: langParam,
          );
          forecast = await _weatherRepo.getForecast(
            lat: loc.lat,
            lon: loc.lon,
            lang: langParam,
          );
        }
      }

      if (weather != null) {
        final useCelsius = await _settingsRepo.getUseCelsius();
        emit(WeatherLoaded(
          weather: weather,
          forecast: forecast,
          useCelsius: useCelsius,
        ));
      } else {
        emit(const WeatherInitial());
      }
    } on WeatherFailure catch (e) {
      emit(WeatherError(e));
    }
  }

  Future<void> _onRefreshRequested(
    WeatherRefreshRequested event,
    Emitter<WeatherState> emit,
  ) async {
    final current = state;
    if (current is WeatherLoaded) {
      add(const WeatherLoadRequested());
    }
  }

  Future<void> _onLocationSelected(
    WeatherLocationSelected event,
    Emitter<WeatherState> emit,
  ) async {
    _lastLat = event.lat;
    _lastLon = event.lon;
    _lastCityName = event.cityName;

    await _settingsRepo.setLastCoordinates(event.lat, event.lon);
    await _settingsRepo.setLastCityName(event.cityName);

    add(const WeatherLoadRequested());
  }

  void _onUnitsChanged(
    WeatherUnitsChanged event,
    Emitter<WeatherState> emit,
  ) {
    final current = state;
    if (current is WeatherLoaded) {
      emit(WeatherLoaded(
        weather: current.weather,
        forecast: current.forecast,
        useCelsius: event.useCelsius,
      ));
    }
  }

  String _toOpenWeatherLang(String code) {
    const map = {
      'en': 'en',
      'fr': 'fr',
      'es': 'es',
      'it': 'it',
    };
    return map[code] ?? 'en';
  }
}
