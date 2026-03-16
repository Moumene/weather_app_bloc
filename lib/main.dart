import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/constants/api_constants.dart';
import 'core/theme/app_theme.dart';
import 'data/datasources/weather_remote_datasource.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/settings_repository.dart';
import 'domain/repositories/weather_repository.dart';
import 'features/settings/bloc/settings_bloc.dart';
import 'features/weather/bloc/weather_bloc.dart';
import 'features/home/screens/home_shell.dart';
import 'l10n/app_localizations.dart';
import 'l10n/app_localizations_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // .env not found; use --dart-define=OPENWEATHER_API_KEY=xxx instead
  }
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (_) => WeatherRepositoryImpl(
            remoteDataSource: WeatherRemoteDataSource(apiKey: ApiConstants.apiKey),
          ),
        ),
        RepositoryProvider<SettingsRepository>(
          create: (_) => SettingsRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingsBloc(
              settingsRepository: context.read<SettingsRepository>(),
            )..add(const SettingsLoadRequested()),
          ),
          BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: context.read<WeatherRepository>(),
              settingsRepository: context.read<SettingsRepository>(),
            )..add(const WeatherLoadRequested()),
          ),
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          buildWhen: (prev, curr) =>
              curr is SettingsLoaded && (prev is! SettingsLoaded || prev.languageCode != curr.languageCode),
          builder: (context, state) {
            final locale = state is SettingsLoaded
                ? Locale(state.languageCode)
                : const Locale('en');

            return MaterialApp(
              title: 'Weather',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.darkTheme,
              locale: locale,
              localizationsDelegates: const [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              home: const HomeShell(),
            );
          },
        ),
      ),
    );
  }
}
