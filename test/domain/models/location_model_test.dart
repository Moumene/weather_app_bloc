import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_bloc/domain/models/location_model.dart';

void main() {
  group('LocationModel', () {
    test('displayName returns name when state is null', () {
      const model = LocationModel(
        name: 'Paris',
        lat: 48.0,
        lon: 2.0,
        country: 'FR',
        state: null,
      );

      expect(model.displayName, equals('Paris'));
    });

    test('displayName returns name and state when state is provided', () {
      const model = LocationModel(
        name: 'New York',
        lat: 40.0,
        lon: -74.0,
        country: 'US',
        state: 'NY',
      );

      expect(model.displayName, equals('New York, NY'));
    });

    test('equality works correctly', () {
      const model1 = LocationModel(
        name: 'Paris',
        lat: 48.0,
        lon: 2.0,
        country: 'FR',
        state: null,
      );

      const model2 = LocationModel(
        name: 'Paris',
        lat: 48.0,
        lon: 2.0,
        country: 'FR',
        state: null,
      );

      expect(model1, equals(model2));
      expect(model1.hashCode, equals(model2.hashCode));
    });
  });
}
