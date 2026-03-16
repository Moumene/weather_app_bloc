/// Maps OpenWeatherMap icon codes to Flutter icon or asset paths
class WeatherIconHelper {
  WeatherIconHelper._();

  /// OpenWeather icon URL: https://openweathermap.org/img/wn/{icon}@2x.png
  static String iconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  }
}
