abstract class SettingsRepository {
  Future<String> getLanguageCode();

  Future<void> setLanguageCode(String code);

  Future<String> getLastCityName();

  Future<void> setLastCityName(String cityName);

  Future<double?> getLastLat();

  Future<double?> getLastLon();

  Future<void> setLastCoordinates(double lat, double lon);

  Future<bool> getUseCelsius();

  Future<void> setUseCelsius(bool useCelsius);
}
