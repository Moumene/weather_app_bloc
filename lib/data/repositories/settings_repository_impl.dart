import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({SharedPreferences? prefs}) : _prefs = prefs;

  SharedPreferences? _prefs;

  static const _keyLanguage = 'language_code';
  static const _keyLastCity = 'last_city_name';
  static const _keyLastLat = 'last_lat';
  static const _keyLastLon = 'last_lon';
  static const _keyUseCelsius = 'use_celsius';

  Future<SharedPreferences> get _storage async =>
      _prefs ??= await SharedPreferences.getInstance();

  @override
  Future<String> getLanguageCode() async {
    final prefs = await _storage;
    return prefs.getString(_keyLanguage) ?? 'en';
  }

  @override
  Future<void> setLanguageCode(String code) async {
    final prefs = await _storage;
    await prefs.setString(_keyLanguage, code);
  }

  @override
  Future<String> getLastCityName() async {
    final prefs = await _storage;
    return prefs.getString(_keyLastCity) ?? '';
  }

  @override
  Future<void> setLastCityName(String cityName) async {
    final prefs = await _storage;
    await prefs.setString(_keyLastCity, cityName);
  }

  @override
  Future<double?> getLastLat() async {
    final prefs = await _storage;
    final v = prefs.getDouble(_keyLastLat);
    return v;
  }

  @override
  Future<double?> getLastLon() async {
    final prefs = await _storage;
    return prefs.getDouble(_keyLastLon);
  }

  @override
  Future<void> setLastCoordinates(double lat, double lon) async {
    final prefs = await _storage;
    await prefs.setDouble(_keyLastLat, lat);
    await prefs.setDouble(_keyLastLon, lon);
  }

  @override
  Future<bool> getUseCelsius() async {
    final prefs = await _storage;
    return prefs.getBool(_keyUseCelsius) ?? true;
  }

  @override
  Future<void> setUseCelsius(bool useCelsius) async {
    final prefs = await _storage;
    await prefs.setBool(_keyUseCelsius, useCelsius);
  }
}
