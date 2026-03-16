part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class SettingsLoadRequested extends SettingsEvent {
  const SettingsLoadRequested();
}

class SettingsLanguageChanged extends SettingsEvent {
  const SettingsLanguageChanged({required this.languageCode});

  final String languageCode;

  @override
  List<Object?> get props => [languageCode];
}

class SettingsUnitChanged extends SettingsEvent {
  const SettingsUnitChanged({required this.useCelsius});

  final bool useCelsius;

  @override
  List<Object?> get props => [useCelsius];
}
