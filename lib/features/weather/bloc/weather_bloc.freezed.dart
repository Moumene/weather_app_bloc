// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_bloc.dart';

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

/// @nodoc
mixin _$WeatherState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState()';
}


}

/// @nodoc
class $WeatherStateCopyWith<$Res>  {
$WeatherStateCopyWith(WeatherState _, $Res Function(WeatherState) __);
}


/// Adds pattern-matching-related methods to [WeatherState].
extension WeatherStatePatterns on WeatherState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WeatherInitial value)?  initial,TResult Function( WeatherLoading value)?  loading,TResult Function( WeatherLoaded value)?  loaded,TResult Function( WeatherError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WeatherInitial() when initial != null:
return initial(_that);case WeatherLoading() when loading != null:
return loading(_that);case WeatherLoaded() when loaded != null:
return loaded(_that);case WeatherError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WeatherInitial value)  initial,required TResult Function( WeatherLoading value)  loading,required TResult Function( WeatherLoaded value)  loaded,required TResult Function( WeatherError value)  error,}){
final _that = this;
switch (_that) {
case WeatherInitial():
return initial(_that);case WeatherLoading():
return loading(_that);case WeatherLoaded():
return loaded(_that);case WeatherError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WeatherInitial value)?  initial,TResult? Function( WeatherLoading value)?  loading,TResult? Function( WeatherLoaded value)?  loaded,TResult? Function( WeatherError value)?  error,}){
final _that = this;
switch (_that) {
case WeatherInitial() when initial != null:
return initial(_that);case WeatherLoading() when loading != null:
return loading(_that);case WeatherLoaded() when loaded != null:
return loaded(_that);case WeatherError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( WeatherModel weather,  List<ForecastModel> forecast,  bool useCelsius)?  loaded,TResult Function( WeatherFailure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WeatherInitial() when initial != null:
return initial();case WeatherLoading() when loading != null:
return loading();case WeatherLoaded() when loaded != null:
return loaded(_that.weather,_that.forecast,_that.useCelsius);case WeatherError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( WeatherModel weather,  List<ForecastModel> forecast,  bool useCelsius)  loaded,required TResult Function( WeatherFailure failure)  error,}) {final _that = this;
switch (_that) {
case WeatherInitial():
return initial();case WeatherLoading():
return loading();case WeatherLoaded():
return loaded(_that.weather,_that.forecast,_that.useCelsius);case WeatherError():
return error(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( WeatherModel weather,  List<ForecastModel> forecast,  bool useCelsius)?  loaded,TResult? Function( WeatherFailure failure)?  error,}) {final _that = this;
switch (_that) {
case WeatherInitial() when initial != null:
return initial();case WeatherLoading() when loading != null:
return loading();case WeatherLoaded() when loaded != null:
return loaded(_that.weather,_that.forecast,_that.useCelsius);case WeatherError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class WeatherInitial implements WeatherState {
  const WeatherInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState.initial()';
}


}




/// @nodoc


class WeatherLoading implements WeatherState {
  const WeatherLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState.loading()';
}


}




/// @nodoc


class WeatherLoaded implements WeatherState {
  const WeatherLoaded({required this.weather, required final  List<ForecastModel> forecast, this.useCelsius = true}): _forecast = forecast;
  

 final  WeatherModel weather;
 final  List<ForecastModel> _forecast;
 List<ForecastModel> get forecast {
  if (_forecast is EqualUnmodifiableListView) return _forecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forecast);
}

@JsonKey() final  bool useCelsius;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherLoadedCopyWith<WeatherLoaded> get copyWith => _$WeatherLoadedCopyWithImpl<WeatherLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoaded&&(identical(other.weather, weather) || other.weather == weather)&&const DeepCollectionEquality().equals(other._forecast, _forecast)&&(identical(other.useCelsius, useCelsius) || other.useCelsius == useCelsius));
}


@override
int get hashCode => Object.hash(runtimeType,weather,const DeepCollectionEquality().hash(_forecast),useCelsius);

@override
String toString() {
  return 'WeatherState.loaded(weather: $weather, forecast: $forecast, useCelsius: $useCelsius)';
}


}

/// @nodoc
abstract mixin class $WeatherLoadedCopyWith<$Res> implements $WeatherStateCopyWith<$Res> {
  factory $WeatherLoadedCopyWith(WeatherLoaded value, $Res Function(WeatherLoaded) _then) = _$WeatherLoadedCopyWithImpl;
@useResult
$Res call({
 WeatherModel weather, List<ForecastModel> forecast, bool useCelsius
});




}
/// @nodoc
class _$WeatherLoadedCopyWithImpl<$Res>
    implements $WeatherLoadedCopyWith<$Res> {
  _$WeatherLoadedCopyWithImpl(this._self, this._then);

  final WeatherLoaded _self;
  final $Res Function(WeatherLoaded) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? weather = null,Object? forecast = null,Object? useCelsius = null,}) {
  return _then(WeatherLoaded(
weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as WeatherModel,forecast: null == forecast ? _self._forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<ForecastModel>,useCelsius: null == useCelsius ? _self.useCelsius : useCelsius // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class WeatherError implements WeatherState {
  const WeatherError(this.failure);
  

 final  WeatherFailure failure;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherErrorCopyWith<WeatherError> get copyWith => _$WeatherErrorCopyWithImpl<WeatherError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'WeatherState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $WeatherErrorCopyWith<$Res> implements $WeatherStateCopyWith<$Res> {
  factory $WeatherErrorCopyWith(WeatherError value, $Res Function(WeatherError) _then) = _$WeatherErrorCopyWithImpl;
@useResult
$Res call({
 WeatherFailure failure
});




}
/// @nodoc
class _$WeatherErrorCopyWithImpl<$Res>
    implements $WeatherErrorCopyWith<$Res> {
  _$WeatherErrorCopyWithImpl(this._self, this._then);

  final WeatherError _self;
  final $Res Function(WeatherError) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(WeatherError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as WeatherFailure,
  ));
}


}

// dart format on
