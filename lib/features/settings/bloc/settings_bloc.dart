import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required SettingsRepository settingsRepository,
  })  : _settingsRepo = settingsRepository,
        super(const SettingsInitial()) {
    on<SettingsLoadRequested>(_onLoadRequested);
    on<SettingsLanguageChanged>(_onLanguageChanged);
    on<SettingsUnitChanged>(_onUnitChanged);
  }

  final SettingsRepository _settingsRepo;

  Future<void> _onLoadRequested(
    SettingsLoadRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoading());

    final languageCode = await _settingsRepo.getLanguageCode();
    final useCelsius = await _settingsRepo.getUseCelsius();

    emit(SettingsLoaded(
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
    emit(SettingsLoaded(
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
    emit(SettingsLoaded(
      languageCode: languageCode,
      useCelsius: event.useCelsius,
    ));
  }
}
