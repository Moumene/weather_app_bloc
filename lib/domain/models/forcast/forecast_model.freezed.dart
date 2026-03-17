// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForecastModel {

@JsonKey(fromJson: _dateTimeFromJson) DateTime get dateTime;@JsonKey(name: 'temp') double get temperature;@JsonKey(name: 'feels_like') double get feelsLike;@JsonKey(name: 'humidity') int get humidity; String get description;@JsonKey(name: 'icon_code') String get iconCode;@JsonKey(name: 'pop') double get pop;

  /// Serializes this ForecastModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastModel&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconCode, iconCode) || other.iconCode == iconCode)&&(identical(other.pop, pop) || other.pop == pop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,temperature,feelsLike,humidity,description,iconCode,pop);

@override
String toString() {
  return 'ForecastModel(dateTime: $dateTime, temperature: $temperature, feelsLike: $feelsLike, humidity: $humidity, description: $description, iconCode: $iconCode, pop: $pop)';
}


}




/// Adds pattern-matching-related methods to [ForecastModel].
extension ForecastModelPatterns on ForecastModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastModel value)  $default,){
final _that = this;
switch (_that) {
case _ForecastModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _dateTimeFromJson)  DateTime dateTime, @JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'humidity')  int humidity,  String description, @JsonKey(name: 'icon_code')  String iconCode, @JsonKey(name: 'pop')  double pop)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastModel() when $default != null:
return $default(_that.dateTime,_that.temperature,_that.feelsLike,_that.humidity,_that.description,_that.iconCode,_that.pop);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _dateTimeFromJson)  DateTime dateTime, @JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'humidity')  int humidity,  String description, @JsonKey(name: 'icon_code')  String iconCode, @JsonKey(name: 'pop')  double pop)  $default,) {final _that = this;
switch (_that) {
case _ForecastModel():
return $default(_that.dateTime,_that.temperature,_that.feelsLike,_that.humidity,_that.description,_that.iconCode,_that.pop);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _dateTimeFromJson)  DateTime dateTime, @JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'humidity')  int humidity,  String description, @JsonKey(name: 'icon_code')  String iconCode, @JsonKey(name: 'pop')  double pop)?  $default,) {final _that = this;
switch (_that) {
case _ForecastModel() when $default != null:
return $default(_that.dateTime,_that.temperature,_that.feelsLike,_that.humidity,_that.description,_that.iconCode,_that.pop);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastModel implements ForecastModel {
  const _ForecastModel({@JsonKey(fromJson: _dateTimeFromJson) required this.dateTime, @JsonKey(name: 'temp') required this.temperature, @JsonKey(name: 'feels_like') required this.feelsLike, @JsonKey(name: 'humidity') required this.humidity, required this.description, @JsonKey(name: 'icon_code') required this.iconCode, @JsonKey(name: 'pop') required this.pop});
  factory _ForecastModel.fromJson(Map<String, dynamic> json) => _$ForecastModelFromJson(json);

@override@JsonKey(fromJson: _dateTimeFromJson) final  DateTime dateTime;
@override@JsonKey(name: 'temp') final  double temperature;
@override@JsonKey(name: 'feels_like') final  double feelsLike;
@override@JsonKey(name: 'humidity') final  int humidity;
@override final  String description;
@override@JsonKey(name: 'icon_code') final  String iconCode;
@override@JsonKey(name: 'pop') final  double pop;


@override
Map<String, dynamic> toJson() {
  return _$ForecastModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastModel&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconCode, iconCode) || other.iconCode == iconCode)&&(identical(other.pop, pop) || other.pop == pop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,temperature,feelsLike,humidity,description,iconCode,pop);

@override
String toString() {
  return 'ForecastModel(dateTime: $dateTime, temperature: $temperature, feelsLike: $feelsLike, humidity: $humidity, description: $description, iconCode: $iconCode, pop: $pop)';
}


}




// dart format on
