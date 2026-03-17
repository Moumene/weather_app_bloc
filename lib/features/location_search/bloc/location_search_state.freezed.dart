// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationSearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationSearchState()';
}


}

/// @nodoc
class $LocationSearchStateCopyWith<$Res>  {
$LocationSearchStateCopyWith(LocationSearchState _, $Res Function(LocationSearchState) __);
}


/// Adds pattern-matching-related methods to [LocationSearchState].
extension LocationSearchStatePatterns on LocationSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LocationSearchInitial value)?  initial,TResult Function( LocationSearchLoading value)?  loading,TResult Function( LocationSearchLoaded value)?  loaded,TResult Function( LocationSearchFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LocationSearchInitial() when initial != null:
return initial(_that);case LocationSearchLoading() when loading != null:
return loading(_that);case LocationSearchLoaded() when loaded != null:
return loaded(_that);case LocationSearchFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LocationSearchInitial value)  initial,required TResult Function( LocationSearchLoading value)  loading,required TResult Function( LocationSearchLoaded value)  loaded,required TResult Function( LocationSearchFailure value)  failure,}){
final _that = this;
switch (_that) {
case LocationSearchInitial():
return initial(_that);case LocationSearchLoading():
return loading(_that);case LocationSearchLoaded():
return loaded(_that);case LocationSearchFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LocationSearchInitial value)?  initial,TResult? Function( LocationSearchLoading value)?  loading,TResult? Function( LocationSearchLoaded value)?  loaded,TResult? Function( LocationSearchFailure value)?  failure,}){
final _that = this;
switch (_that) {
case LocationSearchInitial() when initial != null:
return initial(_that);case LocationSearchLoading() when loading != null:
return loading(_that);case LocationSearchLoaded() when loaded != null:
return loaded(_that);case LocationSearchFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<LocationModel> locations)?  loaded,TResult Function()?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LocationSearchInitial() when initial != null:
return initial();case LocationSearchLoading() when loading != null:
return loading();case LocationSearchLoaded() when loaded != null:
return loaded(_that.locations);case LocationSearchFailure() when failure != null:
return failure();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<LocationModel> locations)  loaded,required TResult Function()  failure,}) {final _that = this;
switch (_that) {
case LocationSearchInitial():
return initial();case LocationSearchLoading():
return loading();case LocationSearchLoaded():
return loaded(_that.locations);case LocationSearchFailure():
return failure();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<LocationModel> locations)?  loaded,TResult? Function()?  failure,}) {final _that = this;
switch (_that) {
case LocationSearchInitial() when initial != null:
return initial();case LocationSearchLoading() when loading != null:
return loading();case LocationSearchLoaded() when loaded != null:
return loaded(_that.locations);case LocationSearchFailure() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class LocationSearchInitial implements LocationSearchState {
  const LocationSearchInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSearchInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationSearchState.initial()';
}


}




/// @nodoc


class LocationSearchLoading implements LocationSearchState {
  const LocationSearchLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSearchLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationSearchState.loading()';
}


}




/// @nodoc


class LocationSearchLoaded implements LocationSearchState {
  const LocationSearchLoaded(final  List<LocationModel> locations): _locations = locations;
  

 final  List<LocationModel> _locations;
 List<LocationModel> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}


/// Create a copy of LocationSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationSearchLoadedCopyWith<LocationSearchLoaded> get copyWith => _$LocationSearchLoadedCopyWithImpl<LocationSearchLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSearchLoaded&&const DeepCollectionEquality().equals(other._locations, _locations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_locations));

@override
String toString() {
  return 'LocationSearchState.loaded(locations: $locations)';
}


}

/// @nodoc
abstract mixin class $LocationSearchLoadedCopyWith<$Res> implements $LocationSearchStateCopyWith<$Res> {
  factory $LocationSearchLoadedCopyWith(LocationSearchLoaded value, $Res Function(LocationSearchLoaded) _then) = _$LocationSearchLoadedCopyWithImpl;
@useResult
$Res call({
 List<LocationModel> locations
});




}
/// @nodoc
class _$LocationSearchLoadedCopyWithImpl<$Res>
    implements $LocationSearchLoadedCopyWith<$Res> {
  _$LocationSearchLoadedCopyWithImpl(this._self, this._then);

  final LocationSearchLoaded _self;
  final $Res Function(LocationSearchLoaded) _then;

/// Create a copy of LocationSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locations = null,}) {
  return _then(LocationSearchLoaded(
null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,
  ));
}


}

/// @nodoc


class LocationSearchFailure implements LocationSearchState {
  const LocationSearchFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSearchFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationSearchState.failure()';
}


}




// dart format on
