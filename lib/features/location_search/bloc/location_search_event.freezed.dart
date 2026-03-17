// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationSearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationSearchEvent()';
}


}

/// @nodoc
class $LocationSearchEventCopyWith<$Res>  {
$LocationSearchEventCopyWith(LocationSearchEvent _, $Res Function(LocationSearchEvent) __);
}


/// Adds pattern-matching-related methods to [LocationSearchEvent].
extension LocationSearchEventPatterns on LocationSearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LocationSearchQueryChanged value)?  queryChanged,TResult Function( LocationSearchCleared value)?  cleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LocationSearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case LocationSearchCleared() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LocationSearchQueryChanged value)  queryChanged,required TResult Function( LocationSearchCleared value)  cleared,}){
final _that = this;
switch (_that) {
case LocationSearchQueryChanged():
return queryChanged(_that);case LocationSearchCleared():
return cleared(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LocationSearchQueryChanged value)?  queryChanged,TResult? Function( LocationSearchCleared value)?  cleared,}){
final _that = this;
switch (_that) {
case LocationSearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case LocationSearchCleared() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  queryChanged,TResult Function()?  cleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LocationSearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case LocationSearchCleared() when cleared != null:
return cleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  queryChanged,required TResult Function()  cleared,}) {final _that = this;
switch (_that) {
case LocationSearchQueryChanged():
return queryChanged(_that.query);case LocationSearchCleared():
return cleared();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  queryChanged,TResult? Function()?  cleared,}) {final _that = this;
switch (_that) {
case LocationSearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case LocationSearchCleared() when cleared != null:
return cleared();case _:
  return null;

}
}

}

/// @nodoc


class LocationSearchQueryChanged implements LocationSearchEvent {
  const LocationSearchQueryChanged({required this.query});
  

 final  String query;

/// Create a copy of LocationSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationSearchQueryChangedCopyWith<LocationSearchQueryChanged> get copyWith => _$LocationSearchQueryChangedCopyWithImpl<LocationSearchQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSearchQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'LocationSearchEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $LocationSearchQueryChangedCopyWith<$Res> implements $LocationSearchEventCopyWith<$Res> {
  factory $LocationSearchQueryChangedCopyWith(LocationSearchQueryChanged value, $Res Function(LocationSearchQueryChanged) _then) = _$LocationSearchQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$LocationSearchQueryChangedCopyWithImpl<$Res>
    implements $LocationSearchQueryChangedCopyWith<$Res> {
  _$LocationSearchQueryChangedCopyWithImpl(this._self, this._then);

  final LocationSearchQueryChanged _self;
  final $Res Function(LocationSearchQueryChanged) _then;

/// Create a copy of LocationSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(LocationSearchQueryChanged(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LocationSearchCleared implements LocationSearchEvent {
  const LocationSearchCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSearchCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationSearchEvent.cleared()';
}


}




// dart format on
