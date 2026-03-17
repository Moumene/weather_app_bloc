// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Clima';

  @override
  String get settings => 'Ajustes';

  @override
  String get searchLocation => 'Buscar ubicación';

  @override
  String get language => 'Idioma';

  @override
  String get units => 'Unidades';

  @override
  String get celsius => 'Celsius';

  @override
  String get fahrenheit => 'Fahrenheit';

  @override
  String get currentLocation => 'Ubicación actual';

  @override
  String get humidity => 'Humedad';

  @override
  String get pressure => 'Presión';

  @override
  String get wind => 'Viento';

  @override
  String get feelsLike => 'Sensación térmica';

  @override
  String get forecast => 'Pronóstico';

  @override
  String get refresh => 'Actualizar';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Reintentar';

  @override
  String get noResults => 'No se encontraron resultados';

  @override
  String get permissionDenied => 'Permiso de ubicación denegado';

  @override
  String get locationDisabled => 'Servicios de ubicación desactivados';

  @override
  String get rising => 'Subiendo';

  @override
  String get falling => 'Bajando';

  @override
  String get steady => 'Estable';

  @override
  String get hourlyForecast => 'Pronóstico horario';

  @override
  String get tenDayForecast => 'Pronóstico 10 días';

  @override
  String get eightDayForecast => 'Pronóstico 8 días';

  @override
  String get sunset => 'Atardecer';
}
