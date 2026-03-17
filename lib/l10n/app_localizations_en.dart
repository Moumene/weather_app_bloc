// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Weather';

  @override
  String get settings => 'Settings';

  @override
  String get searchLocation => 'Search location';

  @override
  String get language => 'Language';

  @override
  String get units => 'Units';

  @override
  String get celsius => 'Celsius';

  @override
  String get fahrenheit => 'Fahrenheit';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get humidity => 'Humidity';

  @override
  String get pressure => 'Pressure';

  @override
  String get wind => 'Wind';

  @override
  String get feelsLike => 'Feels like';

  @override
  String get forecast => 'Forecast';

  @override
  String get refresh => 'Refresh';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get noResults => 'No results found';

  @override
  String get permissionDenied => 'Location permission denied';

  @override
  String get locationDisabled => 'Location services disabled';

  @override
  String get rising => 'Rising';

  @override
  String get falling => 'Falling';

  @override
  String get steady => 'Steady';

  @override
  String get hourlyForecast => 'Hourly Forecast';

  @override
  String get tenDayForecast => '10-Day Forecast';

  @override
  String get eightDayForecast => '8-Day Forecast';

  @override
  String get sunset => 'Sunset';
}
