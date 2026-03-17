import 'package:equatable/equatable.dart';

/// Represents failure during weather operations
sealed class WeatherFailure extends Equatable {
  const WeatherFailure();

  @override
  List<Object?> get props => [];
}

class WeatherFailureNetwork extends WeatherFailure {
  final Object? error;

  const WeatherFailureNetwork([this.error]);

  @override
  List<Object?> get props => [error];
}

class WeatherFailureNotFound extends WeatherFailure {
  const WeatherFailureNotFound();
}

class WeatherFailureServer extends WeatherFailure {
  final String? message;

  const WeatherFailureServer({this.message});

  @override
  List<Object?> get props => [message];
}

class WeatherFailureLocationPermission extends WeatherFailure {
  const WeatherFailureLocationPermission();
}

class WeatherFailureLocationDisabled extends WeatherFailure {
  const WeatherFailureLocationDisabled();
}
