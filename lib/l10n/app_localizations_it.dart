// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Meteo';

  @override
  String get settings => 'Impostazioni';

  @override
  String get searchLocation => 'Cerca località';

  @override
  String get language => 'Lingua';

  @override
  String get units => 'Unità';

  @override
  String get celsius => 'Celsius';

  @override
  String get fahrenheit => 'Fahrenheit';

  @override
  String get currentLocation => 'Posizione attuale';

  @override
  String get humidity => 'Umidità';

  @override
  String get pressure => 'Pressione';

  @override
  String get wind => 'Vento';

  @override
  String get feelsLike => 'Percepita';

  @override
  String get forecast => 'Previsioni';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get error => 'Errore';

  @override
  String get retry => 'Riprova';

  @override
  String get noResults => 'Nessun risultato';

  @override
  String get permissionDenied => 'Permesso di localizzazione negato';

  @override
  String get locationDisabled => 'Servizi di localizzazione disattivati';

  @override
  String get rising => 'In aumento';

  @override
  String get falling => 'In calo';

  @override
  String get steady => 'Stabile';

  @override
  String get hourlyForecast => 'Previsioni orarie';

  @override
  String get tenDayForecast => 'Previsioni 10 giorni';

  @override
  String get eightDayForecast => 'Previsioni 8 giorni';

  @override
  String get sunset => 'Tramonto';
}
