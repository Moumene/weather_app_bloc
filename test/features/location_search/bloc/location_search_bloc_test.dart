import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_bloc/domain/models/location/location_model.dart';
import 'package:weather_app_bloc/domain/repositories/weather_repository.dart';
import 'package:weather_app_bloc/features/location_search/bloc/location_search_bloc.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late MockWeatherRepository mockWeatherRepo;

  final tLocations = [
    const LocationModel(
      name: 'Paris',
      lat: 48.8566,
      lon: 2.3522,
      country: 'FR',
      state: null,
    ),
  ];

  setUp(() {
    mockWeatherRepo = MockWeatherRepository();
  });

  group('LocationSearchBloc', () {
    blocTest<LocationSearchBloc, LocationSearchState>(
      'emits [LocationSearchInitial] when query is empty',
      build: () => LocationSearchBloc(weatherRepository: mockWeatherRepo),
      act: (bloc) => bloc.add(const LocationSearchQueryChanged(query: '')),
      expect: () => [LocationSearchInitial()],
    );

    blocTest<LocationSearchBloc, LocationSearchState>(
      'emits [LocationSearchLoading, LocationSearchLoaded] when search succeeds',
      build: () {
        when(
          () => mockWeatherRepo.searchLocations(any()),
        ).thenAnswer((_) async => tLocations);
        return LocationSearchBloc(weatherRepository: mockWeatherRepo);
      },
      act: (bloc) => bloc.add(const LocationSearchQueryChanged(query: 'Paris')),
      expect: () => [LocationSearchLoading(), LocationSearchLoaded(tLocations)],
    );

    blocTest<LocationSearchBloc, LocationSearchState>(
      'emits [LocationSearchLoading, LocationSearchFailure] when search fails',
      build: () {
        when(
          () => mockWeatherRepo.searchLocations(any()),
        ).thenThrow(Exception());
        return LocationSearchBloc(weatherRepository: mockWeatherRepo);
      },
      act: (bloc) => bloc.add(const LocationSearchQueryChanged(query: 'Paris')),
      expect: () => [LocationSearchLoading(), LocationSearchFailure()],
    );

    blocTest<LocationSearchBloc, LocationSearchState>(
      'emits [LocationSearchInitial] when cleared',
      build: () => LocationSearchBloc(weatherRepository: mockWeatherRepo),
      seed: () => LocationSearchLoaded(tLocations),
      act: (bloc) => bloc.add(const LocationSearchCleared()),
      expect: () => [LocationSearchInitial()],
    );
  });
}
