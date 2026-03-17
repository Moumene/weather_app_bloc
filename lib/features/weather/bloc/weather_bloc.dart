import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/errors/weather_failure.dart';
import '../../../domain/models/daily_forecast/daily_forecast_model.dart';
import '../../../domain/models/forcast/forecast_model.dart';
import '../../../domain/models/weather/weather_model.dart';
import '../../../domain/repositories/settings_repository.dart';
import '../../../domain/repositories/weather_repository.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required WeatherRepository weatherRepository,
    required SettingsRepository settingsRepository,
  }) : _weatherRepo = weatherRepository,
       _settingsRepo = settingsRepository,
       super(const WeatherState.initial()) {
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
  String? _lastCountryCode;

  Future<void> _onLoadRequested(
    WeatherLoadRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherState.loading());

    try {
      final lang = await _settingsRepo.getLanguageCode();
      final langParam = _toOpenWeatherLang(lang);

      double? lat = _lastLat;
      double? lon = _lastLon;
      String? cityName = _lastCityName;
      String? countryCode = _lastCountryCode;

      if (lat == null || lon == null) {
        lat = await _settingsRepo.getLastLat();
        lon = await _settingsRepo.getLastLon();
        cityName = await _settingsRepo.getLastCityName();
        countryCode = await _settingsRepo.getLastCountryCode();
        _lastLat = lat;
        _lastLon = lon;
        _lastCityName = cityName;
        _lastCountryCode = countryCode;
      }

      WeatherModel? weather;
      List<ForecastModel> forecast = [];
      List<DailyForecastModel> dailyForecast = [];

      if (lat != null && lon != null) {
        weather = await _weatherRepo.getCurrentWeather(
          lat: lat,
          lon: lon,
          cityName: cityName,
          countryCode: countryCode?.isNotEmpty == true ? countryCode : null,
          lang: langParam,
        );
        forecast = await _weatherRepo.getForecast(
          lat: lat,
          lon: lon,
          lang: langParam,
        );
        dailyForecast = await _weatherRepo.getDailyForecast(
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
          _lastCityName = loc.name;
          _lastCountryCode = loc.country;
          weather = await _weatherRepo.getCurrentWeather(
            lat: loc.lat,
            lon: loc.lon,
            cityName: loc.name,
            countryCode: loc.country,
            lang: langParam,
          );
          forecast = await _weatherRepo.getForecast(
            lat: loc.lat,
            lon: loc.lon,
            lang: langParam,
          );
          dailyForecast = await _weatherRepo.getDailyForecast(
            lat: loc.lat,
            lon: loc.lon,
            lang: langParam,
          );
        }
      }

      if (weather != null) {
        final useCelsius = await _settingsRepo.getUseCelsius();
        emit(
          WeatherState.loaded(
            weather: weather,
            forecast: forecast,
            dailyForecast: dailyForecast,
            useCelsius: useCelsius,
          ),
        );
      } else {
        emit(const WeatherState.initial());
      }
    } on WeatherFailure catch (e) {
      emit(WeatherState.error(e));
    }
  }

  Future<void> _onRefreshRequested(
    WeatherRefreshRequested event,
    Emitter<WeatherState> emit,
  ) async {
    final current = state;
    if (current is WeatherLoaded) {
      add(const WeatherEvent.loadRequested());
    }
  }

  Future<void> _onLocationSelected(
    WeatherLocationSelected event,
    Emitter<WeatherState> emit,
  ) async {
    _lastLat = event.lat;
    _lastLon = event.lon;
    _lastCityName = event.cityName;
    _lastCountryCode = event.countryCode;

    await _settingsRepo.setLastCoordinates(event.lat, event.lon);
    await _settingsRepo.setLastCityName(event.cityName);
    await _settingsRepo.setLastCountryCode(event.countryCode ?? '');

    add(const WeatherEvent.loadRequested());
  }

  void _onUnitsChanged(WeatherUnitsChanged event, Emitter<WeatherState> emit) {
    final current = state;
    if (current is WeatherLoaded) {
      emit(
        WeatherState.loaded(
          weather: current.weather,
          forecast: current.forecast,
          dailyForecast: current.dailyForecast,
          useCelsius: event.useCelsius,
        ),
      );
    }
  }

  String _toOpenWeatherLang(String code) {
    const map = {'en': 'en', 'fr': 'fr', 'es': 'es', 'it': 'it'};
    return map[code] ?? 'en';
  }
}
