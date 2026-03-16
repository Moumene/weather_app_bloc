part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SettingsLoading extends SettingsState {
  const SettingsLoading();
}

class SettingsLoaded extends SettingsState {
  const SettingsLoaded({
    required this.languageCode,
    this.useCelsius = true,
  });

  final String languageCode;
  final bool useCelsius;

  @override
  List<Object?> get props => [languageCode, useCelsius];
}
