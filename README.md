# Weather App (Bloc)

<p align="center">
<img width="256" height="512" alt="Simulator Screenshot - iPhone 16 Pro - 2026-03-16 at 17 27 33" src="https://github.com/user-attachments/assets/d7ef68ae-4cea-4c1d-b7f1-4bcd736ced19" />
</p>

A Flutter weather mobile app built with **Bloc** architecture, **OpenWeatherMap API**, and multi-language support (English, French, Spanish, Italian).

## Features

- **Weather Dashboard** – Current weather, feels-like temperature, humidity, pressure, wind, and hourly forecast
- **Settings & Location Search** – Search cities worldwide, change language, switch between Celsius/Fahrenheit
- **Bloc Architecture** – Clean separation of business logic (WeatherBloc, SettingsBloc, LocationSearchBloc)
- **Multi-language** – English, French, Spanish, Italian
- **Unit Tests** – Bloc tests, model tests

## Setup

### 1. Get OpenWeatherMap API Key

1. Sign up at [OpenWeatherMap](https://openweathermap.org/api)
2. Create an API key in your account
3. Configure the app with your key (see below)

### 2. Configure API Key

**Option A – Run with environment variable**

```bash
flutter run --dart-define=OPENWEATHER_API_KEY=your_api_key_here
```

**Option B – Edit source**

Edit `lib/core/constants/api_constants.dart` and replace `YOUR_API_KEY_HERE` with your key.

## Project Structure

```
lib/
├── core/                 # Constants, errors, utilities
├── data/                 # Data sources, repositories
├── domain/               # Models, repository interfaces
├── features/
│   ├── location_search/  # Location search bloc & UI
│   ├── settings/        # Settings bloc & screen
│   └── weather/          # Weather bloc & dashboard
├── l10n/                 # Localizations (EN, FR, ES, IT)
└── main.dart
```

## Run

```bash
flutter pub get
flutter run
```

## Test

```bash
flutter test
```

## Screens

1. **Weather Dashboard** – Main screen with current weather and forecast
2. **Settings & Location Search** – Search locations, change language and units



