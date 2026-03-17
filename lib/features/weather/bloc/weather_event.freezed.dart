// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherEvent()';
}


}

/// @nodoc
class $WeatherEventCopyWith<$Res>  {
$WeatherEventCopyWith(WeatherEvent _, $Res Function(WeatherEvent) __);
}


/// Adds pattern-matching-related methods to [WeatherEvent].
extension WeatherEventPatterns on WeatherEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WeatherLoadRequested value)?  loadRequested,TResult Function( WeatherRefreshRequested value)?  refreshRequested,TResult Function( WeatherLocationSelected value)?  locationSelected,TResult Function( WeatherUnitsChanged value)?  unitsChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that);case WeatherRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case WeatherLocationSelected() when locationSelected != null:
return locationSelected(_that);case WeatherUnitsChanged() when unitsChanged != null:
return unitsChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WeatherLoadRequested value)  loadRequested,required TResult Function( WeatherRefreshRequested value)  refreshRequested,required TResult Function( WeatherLocationSelected value)  locationSelected,required TResult Function( WeatherUnitsChanged value)  unitsChanged,}){
final _that = this;
switch (_that) {
case WeatherLoadRequested():
return loadRequested(_that);case WeatherRefreshRequested():
return refreshRequested(_that);case WeatherLocationSelected():
return locationSelected(_that);case WeatherUnitsChanged():
return unitsChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WeatherLoadRequested value)?  loadRequested,TResult? Function( WeatherRefreshRequested value)?  refreshRequested,TResult? Function( WeatherLocationSelected value)?  locationSelected,TResult? Function( WeatherUnitsChanged value)?  unitsChanged,}){
final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that);case WeatherRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case WeatherLocationSelected() when locationSelected != null:
return locationSelected(_that);case WeatherUnitsChanged() when unitsChanged != null:
return unitsChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadRequested,TResult Function()?  refreshRequested,TResult Function( double lat,  double lon,  String cityName)?  locationSelected,TResult Function( bool useCelsius)?  unitsChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested();case WeatherRefreshRequested() when refreshRequested != null:
return refreshRequested();case WeatherLocationSelected() when locationSelected != null:
return locationSelected(_that.lat,_that.lon,_that.cityName);case WeatherUnitsChanged() when unitsChanged != null:
return unitsChanged(_that.useCelsius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadRequested,required TResult Function()  refreshRequested,required TResult Function( double lat,  double lon,  String cityName)  locationSelected,required TResult Function( bool useCelsius)  unitsChanged,}) {final _that = this;
switch (_that) {
case WeatherLoadRequested():
return loadRequested();case WeatherRefreshRequested():
return refreshRequested();case WeatherLocationSelected():
return locationSelected(_that.lat,_that.lon,_that.cityName);case WeatherUnitsChanged():
return unitsChanged(_that.useCelsius);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadRequested,TResult? Function()?  refreshRequested,TResult? Function( double lat,  double lon,  String cityName)?  locationSelected,TResult? Function( bool useCelsius)?  unitsChanged,}) {final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested();case WeatherRefreshRequested() when refreshRequested != null:
return refreshRequested();case WeatherLocationSelected() when locationSelected != null:
return locationSelected(_that.lat,_that.lon,_that.cityName);case WeatherUnitsChanged() when unitsChanged != null:
return unitsChanged(_that.useCelsius);case _:
  return null;

}
}

}

/// @nodoc


class WeatherLoadRequested implements WeatherEvent {
  const WeatherLoadRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoadRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherEvent.loadRequested()';
}


}




/// @nodoc


class WeatherRefreshRequested implements WeatherEvent {
  const WeatherRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherEvent.refreshRequested()';
}


}




/// @nodoc


class WeatherLocationSelected implements WeatherEvent {
  const WeatherLocationSelected({required this.lat, required this.lon, required this.cityName});
  

 final  double lat;
 final  double lon;
 final  String cityName;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherLocationSelectedCopyWith<WeatherLocationSelected> get copyWith => _$WeatherLocationSelectedCopyWithImpl<WeatherLocationSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLocationSelected&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.cityName, cityName) || other.cityName == cityName));
}


@override
int get hashCode => Object.hash(runtimeType,lat,lon,cityName);

@override
String toString() {
  return 'WeatherEvent.locationSelected(lat: $lat, lon: $lon, cityName: $cityName)';
}


}

/// @nodoc
abstract mixin class $WeatherLocationSelectedCopyWith<$Res> implements $WeatherEventCopyWith<$Res> {
  factory $WeatherLocationSelectedCopyWith(WeatherLocationSelected value, $Res Function(WeatherLocationSelected) _then) = _$WeatherLocationSelectedCopyWithImpl;
@useResult
$Res call({
 double lat, double lon, String cityName
});




}
/// @nodoc
class _$WeatherLocationSelectedCopyWithImpl<$Res>
    implements $WeatherLocationSelectedCopyWith<$Res> {
  _$WeatherLocationSelectedCopyWithImpl(this._self, this._then);

  final WeatherLocationSelected _self;
  final $Res Function(WeatherLocationSelected) _then;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lon = null,Object? cityName = null,}) {
  return _then(WeatherLocationSelected(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WeatherUnitsChanged implements WeatherEvent {
  const WeatherUnitsChanged({required this.useCelsius});
  

 final  bool useCelsius;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherUnitsChangedCopyWith<WeatherUnitsChanged> get copyWith => _$WeatherUnitsChangedCopyWithImpl<WeatherUnitsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherUnitsChanged&&(identical(other.useCelsius, useCelsius) || other.useCelsius == useCelsius));
}


@override
int get hashCode => Object.hash(runtimeType,useCelsius);

@override
String toString() {
  return 'WeatherEvent.unitsChanged(useCelsius: $useCelsius)';
}


}

/// @nodoc
abstract mixin class $WeatherUnitsChangedCopyWith<$Res> implements $WeatherEventCopyWith<$Res> {
  factory $WeatherUnitsChangedCopyWith(WeatherUnitsChanged value, $Res Function(WeatherUnitsChanged) _then) = _$WeatherUnitsChangedCopyWithImpl;
@useResult
$Res call({
 bool useCelsius
});




}
/// @nodoc
class _$WeatherUnitsChangedCopyWithImpl<$Res>
    implements $WeatherUnitsChangedCopyWith<$Res> {
  _$WeatherUnitsChangedCopyWithImpl(this._self, this._then);

  final WeatherUnitsChanged _self;
  final $Res Function(WeatherUnitsChanged) _then;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? useCelsius = null,}) {
  return _then(WeatherUnitsChanged(
useCelsius: null == useCelsius ? _self.useCelsius : useCelsius // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
