part of 'settings_bloc.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadRequested() = SettingsLoadRequested;
  const factory SettingsEvent.languageChanged({required String languageCode}) =
      SettingsLanguageChanged;
  const factory SettingsEvent.unitChanged({required bool useCelsius}) =
      SettingsUnitChanged;
}
