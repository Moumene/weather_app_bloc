import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_bloc/domain/models/weather_model.dart';

void main() {
  group('WeatherModel', () {
    test('equality works correctly', () {
      final date = DateTime(2025, 1, 1, 12, 0);
      final model1 = WeatherModel(
        temperature: 23.5,
        feelsLike: 22.0,
        humidity: 65,
        pressure: 1013,
        windSpeed: 5.2,
        description: 'clear sky',
        iconCode: '01d',
        cityName: 'Paris',
        countryCode: 'FR',
        sunrise: date,
        sunset: date,
      );

      final model2 = WeatherModel(
        temperature: 23.5,
        feelsLike: 22.0,
        humidity: 65,
        pressure: 1013,
        windSpeed: 5.2,
        description: 'clear sky',
        iconCode: '01d',
        cityName: 'Paris',
        countryCode: 'FR',
        sunrise: date,
        sunset: date,
      );

      expect(model1, equals(model2));
      expect(model1.hashCode, equals(model2.hashCode));
    });

    test('props contain all fields', () {
      final date = DateTime(2025, 1, 1, 12, 0);
      final model = WeatherModel(
        temperature: 23.5,
        feelsLike: 22.0,
        humidity: 65,
        pressure: 1013,
        windSpeed: 5.2,
        description: 'clear sky',
        iconCode: '01d',
        cityName: 'Paris',
        countryCode: 'FR',
        sunrise: date,
        sunset: date,
      );

      expect(model.props.length, equals(13));
    });
  });
}
