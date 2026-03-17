// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyForecastModel {

@JsonKey(fromJson: _dateFromJson) DateTime get date;@JsonKey(name: 'day_name') String get dayName;@JsonKey(name: 'min_temp') double get minTemp;@JsonKey(name: 'max_temp') double get maxTemp;@JsonKey(name: 'icon_code') String get iconCode; String get description;

  /// Serializes this DailyForecastModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyForecastModel&&(identical(other.date, date) || other.date == date)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.minTemp, minTemp) || other.minTemp == minTemp)&&(identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp)&&(identical(other.iconCode, iconCode) || other.iconCode == iconCode)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dayName,minTemp,maxTemp,iconCode,description);

@override
String toString() {
  return 'DailyForecastModel(date: $date, dayName: $dayName, minTemp: $minTemp, maxTemp: $maxTemp, iconCode: $iconCode, description: $description)';
}


}




/// Adds pattern-matching-related methods to [DailyForecastModel].
extension DailyForecastModelPatterns on DailyForecastModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyForecastModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyForecastModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyForecastModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyForecastModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyForecastModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyForecastModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _dateFromJson)  DateTime date, @JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'min_temp')  double minTemp, @JsonKey(name: 'max_temp')  double maxTemp, @JsonKey(name: 'icon_code')  String iconCode,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyForecastModel() when $default != null:
return $default(_that.date,_that.dayName,_that.minTemp,_that.maxTemp,_that.iconCode,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _dateFromJson)  DateTime date, @JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'min_temp')  double minTemp, @JsonKey(name: 'max_temp')  double maxTemp, @JsonKey(name: 'icon_code')  String iconCode,  String description)  $default,) {final _that = this;
switch (_that) {
case _DailyForecastModel():
return $default(_that.date,_that.dayName,_that.minTemp,_that.maxTemp,_that.iconCode,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _dateFromJson)  DateTime date, @JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'min_temp')  double minTemp, @JsonKey(name: 'max_temp')  double maxTemp, @JsonKey(name: 'icon_code')  String iconCode,  String description)?  $default,) {final _that = this;
switch (_that) {
case _DailyForecastModel() when $default != null:
return $default(_that.date,_that.dayName,_that.minTemp,_that.maxTemp,_that.iconCode,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyForecastModel implements DailyForecastModel {
  const _DailyForecastModel({@JsonKey(fromJson: _dateFromJson) required this.date, @JsonKey(name: 'day_name') required this.dayName, @JsonKey(name: 'min_temp') required this.minTemp, @JsonKey(name: 'max_temp') required this.maxTemp, @JsonKey(name: 'icon_code') required this.iconCode, required this.description});
  factory _DailyForecastModel.fromJson(Map<String, dynamic> json) => _$DailyForecastModelFromJson(json);

@override@JsonKey(fromJson: _dateFromJson) final  DateTime date;
@override@JsonKey(name: 'day_name') final  String dayName;
@override@JsonKey(name: 'min_temp') final  double minTemp;
@override@JsonKey(name: 'max_temp') final  double maxTemp;
@override@JsonKey(name: 'icon_code') final  String iconCode;
@override final  String description;


@override
Map<String, dynamic> toJson() {
  return _$DailyForecastModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyForecastModel&&(identical(other.date, date) || other.date == date)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.minTemp, minTemp) || other.minTemp == minTemp)&&(identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp)&&(identical(other.iconCode, iconCode) || other.iconCode == iconCode)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dayName,minTemp,maxTemp,iconCode,description);

@override
String toString() {
  return 'DailyForecastModel(date: $date, dayName: $dayName, minTemp: $minTemp, maxTemp: $maxTemp, iconCode: $iconCode, description: $description)';
}


}




// dart format on
