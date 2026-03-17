import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/settings_repository.dart';

import 'settings_event.dart';
import 'settings_state.dart';

export 'settings_event.dart';
export 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required SettingsRepository settingsRepository,
  })  : _settingsRepo = settingsRepository,
        super(const SettingsState.initial()) {
    on<SettingsLoadRequested>(_onLoadRequested);
    on<SettingsLanguageChanged>(_onLanguageChanged);
    on<SettingsUnitChanged>(_onUnitChanged);
  }

  final SettingsRepository _settingsRepo;

  Future<void> _onLoadRequested(
    SettingsLoadRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());

    final languageCode = await _settingsRepo.getLanguageCode();
    final useCelsius = await _settingsRepo.getUseCelsius();

    emit(SettingsState.loaded(
      languageCode: languageCode,
      useCelsius: useCelsius,
    ));
  }

  Future<void> _onLanguageChanged(
    SettingsLanguageChanged event,
    Emitter<SettingsState> emit,
  ) async {
    await _settingsRepo.setLanguageCode(event.languageCode);
    final useCelsius = await _settingsRepo.getUseCelsius();
    emit(SettingsState.loaded(
      languageCode: event.languageCode,
      useCelsius: useCelsius,
    ));
  }

  Future<void> _onUnitChanged(
    SettingsUnitChanged event,
    Emitter<SettingsState> emit,
  ) async {
    await _settingsRepo.setUseCelsius(event.useCelsius);
    final languageCode = await _settingsRepo.getLanguageCode();
    emit(SettingsState.loaded(
      languageCode: languageCode,
      useCelsius: event.useCelsius,
    ));
  }
}
