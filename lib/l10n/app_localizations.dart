import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('fr'),
    Locale('es'),
    Locale('it'),
  ];

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Weather',
      'settings': 'Settings',
      'searchLocation': 'Search location',
      'language': 'Language',
      'units': 'Units',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'currentLocation': 'Current Location',
      'humidity': 'Humidity',
      'pressure': 'Pressure',
      'wind': 'Wind',
      'feelsLike': 'Feels like',
      'forecast': 'Forecast',
      'refresh': 'Refresh',
      'error': 'Error',
      'retry': 'Retry',
      'noResults': 'No results found',
      'permissionDenied': 'Location permission denied',
      'locationDisabled': 'Location services disabled',
      'rising': 'Rising',
      'falling': 'Falling',
      'steady': 'Steady',
      'hourlyForecast': 'Hourly Forecast',
      'tenDayForecast': '10-Day Forecast',
      'eightDayForecast': '8-Day Forecast',
      'sunset': 'Sunset',
    },
    'fr': {
      'appTitle': 'Météo',
      'settings': 'Paramètres',
      'searchLocation': 'Rechercher un lieu',
      'language': 'Langue',
      'units': 'Unités',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'currentLocation': 'Position actuelle',
      'humidity': 'Humidité',
      'pressure': 'Pression',
      'wind': 'Vent',
      'feelsLike': 'Ressenti',
      'forecast': 'Prévisions',
      'refresh': 'Actualiser',
      'error': 'Erreur',
      'retry': 'Réessayer',
      'noResults': 'Aucun résultat',
      'permissionDenied': 'Permission de localisation refusée',
      'locationDisabled': 'Services de localisation désactivés',
      'rising': 'En hausse',
      'falling': 'En baisse',
      'steady': 'Stable',
      'hourlyForecast': 'Prévisions horaires',
      'tenDayForecast': 'Prévisions 10 jours',
      'eightDayForecast': 'Prévisions 8 jours',
      'sunset': 'Coucher du soleil',
    },
    'es': {
      'appTitle': 'Clima',
      'settings': 'Ajustes',
      'searchLocation': 'Buscar ubicación',
      'language': 'Idioma',
      'units': 'Unidades',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'currentLocation': 'Ubicación actual',
      'humidity': 'Humedad',
      'pressure': 'Presión',
      'wind': 'Viento',
      'feelsLike': 'Sensación térmica',
      'forecast': 'Pronóstico',
      'refresh': 'Actualizar',
      'error': 'Error',
      'retry': 'Reintentar',
      'noResults': 'No se encontraron resultados',
      'permissionDenied': 'Permiso de ubicación denegado',
      'locationDisabled': 'Servicios de ubicación desactivados',
      'rising': 'Subiendo',
      'falling': 'Bajando',
      'steady': 'Estable',
      'hourlyForecast': 'Pronóstico horario',
      'tenDayForecast': 'Pronóstico 10 días',
      'eightDayForecast': 'Pronóstico 8 días',
      'sunset': 'Atardecer',
    },
    'it': {
      'appTitle': 'Meteo',
      'settings': 'Impostazioni',
      'searchLocation': 'Cerca località',
      'language': 'Lingua',
      'units': 'Unità',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'currentLocation': 'Posizione attuale',
      'humidity': 'Umidità',
      'pressure': 'Pressione',
      'wind': 'Vento',
      'feelsLike': 'Percepita',
      'forecast': 'Previsioni',
      'refresh': 'Aggiorna',
      'error': 'Errore',
      'retry': 'Riprova',
      'noResults': 'Nessun risultato',
      'permissionDenied': 'Permesso di localizzazione negato',
      'locationDisabled': 'Servizi di localizzazione disattivati',
      'rising': 'In aumento',
      'falling': 'In calo',
      'steady': 'Stabile',
      'hourlyForecast': 'Previsioni orarie',
      'tenDayForecast': 'Previsioni 10 giorni',
      'eightDayForecast': 'Previsioni 8 giorni',
      'sunset': 'Tramonto',
    },
  };

  String get appTitle => _translate('appTitle');
  String get settings => _translate('settings');
  String get searchLocation => _translate('searchLocation');
  String get language => _translate('language');
  String get units => _translate('units');
  String get celsius => _translate('celsius');
  String get fahrenheit => _translate('fahrenheit');
  String get currentLocation => _translate('currentLocation');
  String get humidity => _translate('humidity');
  String get pressure => _translate('pressure');
  String get wind => _translate('wind');
  String get feelsLike => _translate('feelsLike');
  String get forecast => _translate('forecast');
  String get refresh => _translate('refresh');
  String get error => _translate('error');
  String get retry => _translate('retry');
  String get noResults => _translate('noResults');
  String get permissionDenied => _translate('permissionDenied');
  String get locationDisabled => _translate('locationDisabled');
  String get rising => _translate('rising');
  String get falling => _translate('falling');
  String get steady => _translate('steady');
  String get hourlyForecast => _translate('hourlyForecast');
  String get tenDayForecast => _translate('tenDayForecast');
  String get eightDayForecast => _translate('eightDayForecast');
  String get sunset => _translate('sunset');

  String _translate(String key) {
    final lang = locale.languageCode;
    final values = _localizedValues[lang] ?? _localizedValues['en']!;
    return values[key] ?? key;
  }
}
