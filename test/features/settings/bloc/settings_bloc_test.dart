import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_bloc/domain/repositories/settings_repository.dart';
import 'package:weather_app_bloc/features/settings/bloc/settings_bloc.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late MockSettingsRepository mockSettingsRepo;

  setUp(() {
    mockSettingsRepo = MockSettingsRepository();
  });

  group('SettingsBloc', () {
    blocTest<SettingsBloc, SettingsState>(
      'emits [SettingsLoading, SettingsLoaded] when load succeeds',
      build: () {
        when(() => mockSettingsRepo.getLanguageCode()).thenAnswer((_) async => 'en');
        when(() => mockSettingsRepo.getUseCelsius()).thenAnswer((_) async => true);
        return SettingsBloc(settingsRepository: mockSettingsRepo);
      },
      act: (bloc) => bloc.add(const SettingsLoadRequested()),
      expect: () => [
        SettingsLoading(),
        SettingsLoaded(languageCode: 'en', useCelsius: true),
      ],
    );

    blocTest<SettingsBloc, SettingsState>(
      'emits SettingsLoaded with new language when language changed',
      build: () {
        when(() => mockSettingsRepo.setLanguageCode(any())).thenAnswer((_) async {});
        when(() => mockSettingsRepo.getUseCelsius()).thenAnswer((_) async => true);
        return SettingsBloc(settingsRepository: mockSettingsRepo);
      },
      seed: () => SettingsLoaded(languageCode: 'en', useCelsius: true),
      act: (bloc) => bloc.add(const SettingsLanguageChanged(languageCode: 'fr')),
      expect: () => [
        SettingsLoaded(languageCode: 'fr', useCelsius: true),
      ],
    );

    blocTest<SettingsBloc, SettingsState>(
      'emits SettingsLoaded with new unit when unit changed',
      build: () {
        when(() => mockSettingsRepo.setUseCelsius(any())).thenAnswer((_) async {});
        when(() => mockSettingsRepo.getLanguageCode()).thenAnswer((_) async => 'en');
        return SettingsBloc(settingsRepository: mockSettingsRepo);
      },
      seed: () => SettingsLoaded(languageCode: 'en', useCelsius: true),
      act: (bloc) => bloc.add(const SettingsUnitChanged(useCelsius: false)),
      expect: () => [
        SettingsLoaded(languageCode: 'en', useCelsius: false),
      ],
    );
  });
}
