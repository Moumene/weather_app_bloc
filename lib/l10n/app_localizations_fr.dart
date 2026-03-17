// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Météo';

  @override
  String get settings => 'Paramètres';

  @override
  String get searchLocation => 'Rechercher un lieu';

  @override
  String get language => 'Langue';

  @override
  String get units => 'Unités';

  @override
  String get celsius => 'Celsius';

  @override
  String get fahrenheit => 'Fahrenheit';

  @override
  String get currentLocation => 'Position actuelle';

  @override
  String get humidity => 'Humidité';

  @override
  String get pressure => 'Pression';

  @override
  String get wind => 'Vent';

  @override
  String get feelsLike => 'Ressenti';

  @override
  String get forecast => 'Prévisions';

  @override
  String get refresh => 'Actualiser';

  @override
  String get error => 'Erreur';

  @override
  String get retry => 'Réessayer';

  @override
  String get noResults => 'Aucun résultat';

  @override
  String get permissionDenied => 'Permission de localisation refusée';

  @override
  String get locationDisabled => 'Services de localisation désactivés';

  @override
  String get rising => 'En hausse';

  @override
  String get falling => 'En baisse';

  @override
  String get steady => 'Stable';

  @override
  String get hourlyForecast => 'Prévisions horaires';

  @override
  String get tenDayForecast => 'Prévisions 10 jours';

  @override
  String get eightDayForecast => 'Prévisions 8 jours';

  @override
  String get sunset => 'Coucher du soleil';
}
