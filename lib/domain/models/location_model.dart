import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  const LocationModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
  });

  final String name;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  String get displayName => state != null ? '$name, $state' : name;

  @override
  List<Object?> get props => [name, lat, lon, country, state];
}
