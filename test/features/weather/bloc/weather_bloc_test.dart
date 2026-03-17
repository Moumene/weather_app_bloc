import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_bloc/core/errors/weather_failure.dart';
import 'package:weather_app_bloc/domain/models/forcast/forecast_model.dart';
import 'package:weather_app_bloc/domain/models/weather/weather_model.dart';
import 'package:weather_app_bloc/domain/repositories/settings_repository.dart';
import 'package:weather_app_bloc/domain/repositories/weather_repository.dart';
import 'package:weather_app_bloc/features/weather/bloc/weather_bloc.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late MockWeatherRepository mockWeatherRepo;
  late MockSettingsRepository mockSettingsRepo;

  final tWeather = WeatherModel(
    temperature: 23.5,
    feelsLike: 22.0,
    humidity: 65,
    pressure: 1013,
    windSpeed: 5.2,
    description: 'clear sky',
    iconCode: '01d',
    cityName: 'Paris',
    countryCode: 'FR',
    sunrise: DateTime(2025, 1, 1, 6, 0),
    sunset: DateTime(2025, 1, 1, 18, 0),
    visibility: 10000,
    windDeg: 180,
  );

  final tForecast = [
    ForecastModel(
      dateTime: DateTime(2025, 1, 1, 12, 0),
      temperature: 24.0,
      feelsLike: 23.0,
      humidity: 60,
      description: 'clear',
      iconCode: '01d',
      pop: 0.0,
    ),
  ];

  setUp(() {
    mockWeatherRepo = MockWeatherRepository();
    mockSettingsRepo = MockSettingsRepository();
  });

  group('WeatherBloc', () {
    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherLoading, WeatherLoaded] when load succeeds with saved location',
      build: () {
        when(
          () => mockSettingsRepo.getLanguageCode(),
        ).thenAnswer((_) async => 'en');
        when(() => mockSettingsRepo.getLastLat()).thenAnswer((_) async => 48.0);
        when(() => mockSettingsRepo.getLastLon()).thenAnswer((_) async => 2.0);
        when(
          () => mockSettingsRepo.getLastCityName(),
        ).thenAnswer((_) async => '');
        when(
          () => mockSettingsRepo.getUseCelsius(),
        ).thenAnswer((_) async => true);
        when(
          () => mockWeatherRepo.getCurrentWeather(
            lat: any(named: 'lat'),
            lon: any(named: 'lon'),
            lang: any(named: 'lang'),
          ),
        ).thenAnswer((_) async => tWeather);
        when(
          () => mockWeatherRepo.getForecast(
            lat: any(named: 'lat'),
            lon: any(named: 'lon'),
            lang: any(named: 'lang'),
          ),
        ).thenAnswer((_) async => tForecast);
        return WeatherBloc(
          weatherRepository: mockWeatherRepo,
          settingsRepository: mockSettingsRepo,
        );
      },
      act: (bloc) => bloc.add(const WeatherLoadRequested()),
      expect: () => [
        WeatherLoading(),
        WeatherLoaded(weather: tWeather, forecast: tForecast, useCelsius: true),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherLoading, WeatherError] when load fails',
      build: () {
        when(
          () => mockSettingsRepo.getLanguageCode(),
        ).thenAnswer((_) async => 'en');
        when(() => mockSettingsRepo.getLastLat()).thenAnswer((_) async => 48.0);
        when(() => mockSettingsRepo.getLastLon()).thenAnswer((_) async => 2.0);
        when(
          () => mockSettingsRepo.getLastCityName(),
        ).thenAnswer((_) async => '');
        when(
          () => mockWeatherRepo.getCurrentWeather(
            lat: any(named: 'lat'),
            lon: any(named: 'lon'),
            lang: any(named: 'lang'),
          ),
        ).thenThrow(const WeatherFailureNetwork());
        return WeatherBloc(
          weatherRepository: mockWeatherRepo,
          settingsRepository: mockSettingsRepo,
        );
      },
      act: (bloc) => bloc.add(const WeatherLoadRequested()),
      expect: () => [
        WeatherLoading(),
        WeatherError(const WeatherFailureNetwork()),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherLoading, WeatherLoaded] when location selected',
      build: () {
        when(
          () => mockSettingsRepo.getLanguageCode(),
        ).thenAnswer((_) async => 'en');
        when(
          () => mockSettingsRepo.getUseCelsius(),
        ).thenAnswer((_) async => true);
        when(
          () => mockSettingsRepo.setLastCoordinates(any(), any()),
        ).thenAnswer((_) async {});
        when(
          () => mockSettingsRepo.setLastCityName(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockWeatherRepo.getCurrentWeather(
            lat: any(named: 'lat'),
            lon: any(named: 'lon'),
            lang: any(named: 'lang'),
          ),
        ).thenAnswer((_) async => tWeather);
        when(
          () => mockWeatherRepo.getForecast(
            lat: any(named: 'lat'),
            lon: any(named: 'lon'),
            lang: any(named: 'lang'),
          ),
        ).thenAnswer((_) async => tForecast);
        return WeatherBloc(
          weatherRepository: mockWeatherRepo,
          settingsRepository: mockSettingsRepo,
        );
      },
      act: (bloc) => bloc.add(
        const WeatherLocationSelected(lat: 48.0, lon: 2.0, cityName: 'Paris'),
      ),
      expect: () => [
        WeatherLoading(),
        WeatherLoaded(weather: tWeather, forecast: tForecast, useCelsius: true),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits WeatherLoaded with updated useCelsius when WeatherUnitsChanged',
      build: () {
        return WeatherBloc(
          weatherRepository: mockWeatherRepo,
          settingsRepository: mockSettingsRepo,
        );
      },
      seed: () => WeatherLoaded(
        weather: tWeather,
        forecast: tForecast,
        useCelsius: true,
      ),
      act: (bloc) => bloc.add(const WeatherUnitsChanged(useCelsius: false)),
      expect: () => [
        WeatherLoaded(
          weather: tWeather,
          forecast: tForecast,
          useCelsius: false,
        ),
      ],
    );
  });
}
