abstract class SettingsRepository {
  Future<String> getLanguageCode();

  Future<void> setLanguageCode(String code);

  Future<String> getLastCityName();

  Future<void> setLastCityName(String cityName);

  Future<String> getLastCountryCode();

  Future<void> setLastCountryCode(String countryCode);

  Future<double?> getLastLat();

  Future<double?> getLastLon();

  Future<void> setLastCoordinates(double lat, double lon);

  Future<bool> getUseCelsius();

  Future<void> setUseCelsius(bool useCelsius);
}
