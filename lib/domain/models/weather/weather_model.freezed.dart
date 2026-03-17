// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherModel {

@JsonKey(name: 'temp') double get temperature;@JsonKey(name: 'feels_like') double get feelsLike;@JsonKey(name: 'humidity') int get humidity;@JsonKey(name: 'pressure') int get pressure;@JsonKey(name: 'visibility') int? get visibility;@JsonKey(name: 'wind_speed') double get windSpeed;@JsonKey(name: 'wind_deg') int? get windDeg;@JsonKey(name: 'description') String get description;@JsonKey(name: 'icon_code') String get iconCode;@JsonKey(name: 'city_name') String get cityName;@JsonKey(name: 'country_code') String get countryCode;@JsonKey(name: 'sunrise') DateTime? get sunrise;@JsonKey(name: 'sunset') DateTime? get sunset;@JsonKey(name: 'timezone_offset') int? get timezoneOffset;@JsonKey(name: 'uvi') double? get uvi;

  /// Serializes this WeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDeg, windDeg) || other.windDeg == windDeg)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconCode, iconCode) || other.iconCode == iconCode)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.timezoneOffset, timezoneOffset) || other.timezoneOffset == timezoneOffset)&&(identical(other.uvi, uvi) || other.uvi == uvi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temperature,feelsLike,humidity,pressure,visibility,windSpeed,windDeg,description,iconCode,cityName,countryCode,sunrise,sunset,timezoneOffset,uvi);

@override
String toString() {
  return 'WeatherModel(temperature: $temperature, feelsLike: $feelsLike, humidity: $humidity, pressure: $pressure, visibility: $visibility, windSpeed: $windSpeed, windDeg: $windDeg, description: $description, iconCode: $iconCode, cityName: $cityName, countryCode: $countryCode, sunrise: $sunrise, sunset: $sunset, timezoneOffset: $timezoneOffset, uvi: $uvi)';
}


}




/// Adds pattern-matching-related methods to [WeatherModel].
extension WeatherModelPatterns on WeatherModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'humidity')  int humidity, @JsonKey(name: 'pressure')  int pressure, @JsonKey(name: 'visibility')  int? visibility, @JsonKey(name: 'wind_speed')  double windSpeed, @JsonKey(name: 'wind_deg')  int? windDeg, @JsonKey(name: 'description')  String description, @JsonKey(name: 'icon_code')  String iconCode, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'country_code')  String countryCode, @JsonKey(name: 'sunrise')  DateTime? sunrise, @JsonKey(name: 'sunset')  DateTime? sunset, @JsonKey(name: 'timezone_offset')  int? timezoneOffset, @JsonKey(name: 'uvi')  double? uvi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.temperature,_that.feelsLike,_that.humidity,_that.pressure,_that.visibility,_that.windSpeed,_that.windDeg,_that.description,_that.iconCode,_that.cityName,_that.countryCode,_that.sunrise,_that.sunset,_that.timezoneOffset,_that.uvi);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'humidity')  int humidity, @JsonKey(name: 'pressure')  int pressure, @JsonKey(name: 'visibility')  int? visibility, @JsonKey(name: 'wind_speed')  double windSpeed, @JsonKey(name: 'wind_deg')  int? windDeg, @JsonKey(name: 'description')  String description, @JsonKey(name: 'icon_code')  String iconCode, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'country_code')  String countryCode, @JsonKey(name: 'sunrise')  DateTime? sunrise, @JsonKey(name: 'sunset')  DateTime? sunset, @JsonKey(name: 'timezone_offset')  int? timezoneOffset, @JsonKey(name: 'uvi')  double? uvi)  $default,) {final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that.temperature,_that.feelsLike,_that.humidity,_that.pressure,_that.visibility,_that.windSpeed,_that.windDeg,_that.description,_that.iconCode,_that.cityName,_that.countryCode,_that.sunrise,_that.sunset,_that.timezoneOffset,_that.uvi);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'humidity')  int humidity, @JsonKey(name: 'pressure')  int pressure, @JsonKey(name: 'visibility')  int? visibility, @JsonKey(name: 'wind_speed')  double windSpeed, @JsonKey(name: 'wind_deg')  int? windDeg, @JsonKey(name: 'description')  String description, @JsonKey(name: 'icon_code')  String iconCode, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'country_code')  String countryCode, @JsonKey(name: 'sunrise')  DateTime? sunrise, @JsonKey(name: 'sunset')  DateTime? sunset, @JsonKey(name: 'timezone_offset')  int? timezoneOffset, @JsonKey(name: 'uvi')  double? uvi)?  $default,) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.temperature,_that.feelsLike,_that.humidity,_that.pressure,_that.visibility,_that.windSpeed,_that.windDeg,_that.description,_that.iconCode,_that.cityName,_that.countryCode,_that.sunrise,_that.sunset,_that.timezoneOffset,_that.uvi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherModel implements WeatherModel {
  const _WeatherModel({@JsonKey(name: 'temp') required this.temperature, @JsonKey(name: 'feels_like') required this.feelsLike, @JsonKey(name: 'humidity') required this.humidity, @JsonKey(name: 'pressure') required this.pressure, @JsonKey(name: 'visibility') required this.visibility, @JsonKey(name: 'wind_speed') required this.windSpeed, @JsonKey(name: 'wind_deg') required this.windDeg, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'icon_code') required this.iconCode, @JsonKey(name: 'city_name') required this.cityName, @JsonKey(name: 'country_code') required this.countryCode, @JsonKey(name: 'sunrise') this.sunrise, @JsonKey(name: 'sunset') this.sunset, @JsonKey(name: 'timezone_offset') this.timezoneOffset, @JsonKey(name: 'uvi') this.uvi});
  factory _WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

@override@JsonKey(name: 'temp') final  double temperature;
@override@JsonKey(name: 'feels_like') final  double feelsLike;
@override@JsonKey(name: 'humidity') final  int humidity;
@override@JsonKey(name: 'pressure') final  int pressure;
@override@JsonKey(name: 'visibility') final  int? visibility;
@override@JsonKey(name: 'wind_speed') final  double windSpeed;
@override@JsonKey(name: 'wind_deg') final  int? windDeg;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'icon_code') final  String iconCode;
@override@JsonKey(name: 'city_name') final  String cityName;
@override@JsonKey(name: 'country_code') final  String countryCode;
@override@JsonKey(name: 'sunrise') final  DateTime? sunrise;
@override@JsonKey(name: 'sunset') final  DateTime? sunset;
@override@JsonKey(name: 'timezone_offset') final  int? timezoneOffset;
@override@JsonKey(name: 'uvi') final  double? uvi;


@override
Map<String, dynamic> toJson() {
  return _$WeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDeg, windDeg) || other.windDeg == windDeg)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconCode, iconCode) || other.iconCode == iconCode)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.timezoneOffset, timezoneOffset) || other.timezoneOffset == timezoneOffset)&&(identical(other.uvi, uvi) || other.uvi == uvi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temperature,feelsLike,humidity,pressure,visibility,windSpeed,windDeg,description,iconCode,cityName,countryCode,sunrise,sunset,timezoneOffset,uvi);

@override
String toString() {
  return 'WeatherModel(temperature: $temperature, feelsLike: $feelsLike, humidity: $humidity, pressure: $pressure, visibility: $visibility, windSpeed: $windSpeed, windDeg: $windDeg, description: $description, iconCode: $iconCode, cityName: $cityName, countryCode: $countryCode, sunrise: $sunrise, sunset: $sunset, timezoneOffset: $timezoneOffset, uvi: $uvi)';
}


}




// dart format on
