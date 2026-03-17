// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SettingsLoadRequested value)?  loadRequested,TResult Function( SettingsLanguageChanged value)?  languageChanged,TResult Function( SettingsUnitChanged value)?  unitChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SettingsLoadRequested() when loadRequested != null:
return loadRequested(_that);case SettingsLanguageChanged() when languageChanged != null:
return languageChanged(_that);case SettingsUnitChanged() when unitChanged != null:
return unitChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SettingsLoadRequested value)  loadRequested,required TResult Function( SettingsLanguageChanged value)  languageChanged,required TResult Function( SettingsUnitChanged value)  unitChanged,}){
final _that = this;
switch (_that) {
case SettingsLoadRequested():
return loadRequested(_that);case SettingsLanguageChanged():
return languageChanged(_that);case SettingsUnitChanged():
return unitChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SettingsLoadRequested value)?  loadRequested,TResult? Function( SettingsLanguageChanged value)?  languageChanged,TResult? Function( SettingsUnitChanged value)?  unitChanged,}){
final _that = this;
switch (_that) {
case SettingsLoadRequested() when loadRequested != null:
return loadRequested(_that);case SettingsLanguageChanged() when languageChanged != null:
return languageChanged(_that);case SettingsUnitChanged() when unitChanged != null:
return unitChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadRequested,TResult Function( String languageCode)?  languageChanged,TResult Function( bool useCelsius)?  unitChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SettingsLoadRequested() when loadRequested != null:
return loadRequested();case SettingsLanguageChanged() when languageChanged != null:
return languageChanged(_that.languageCode);case SettingsUnitChanged() when unitChanged != null:
return unitChanged(_that.useCelsius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadRequested,required TResult Function( String languageCode)  languageChanged,required TResult Function( bool useCelsius)  unitChanged,}) {final _that = this;
switch (_that) {
case SettingsLoadRequested():
return loadRequested();case SettingsLanguageChanged():
return languageChanged(_that.languageCode);case SettingsUnitChanged():
return unitChanged(_that.useCelsius);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadRequested,TResult? Function( String languageCode)?  languageChanged,TResult? Function( bool useCelsius)?  unitChanged,}) {final _that = this;
switch (_that) {
case SettingsLoadRequested() when loadRequested != null:
return loadRequested();case SettingsLanguageChanged() when languageChanged != null:
return languageChanged(_that.languageCode);case SettingsUnitChanged() when unitChanged != null:
return unitChanged(_that.useCelsius);case _:
  return null;

}
}

}

/// @nodoc


class SettingsLoadRequested implements SettingsEvent {
  const SettingsLoadRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsLoadRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.loadRequested()';
}


}




/// @nodoc


class SettingsLanguageChanged implements SettingsEvent {
  const SettingsLanguageChanged({required this.languageCode});
  

 final  String languageCode;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsLanguageChangedCopyWith<SettingsLanguageChanged> get copyWith => _$SettingsLanguageChangedCopyWithImpl<SettingsLanguageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsLanguageChanged&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode));
}


@override
int get hashCode => Object.hash(runtimeType,languageCode);

@override
String toString() {
  return 'SettingsEvent.languageChanged(languageCode: $languageCode)';
}


}

/// @nodoc
abstract mixin class $SettingsLanguageChangedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory $SettingsLanguageChangedCopyWith(SettingsLanguageChanged value, $Res Function(SettingsLanguageChanged) _then) = _$SettingsLanguageChangedCopyWithImpl;
@useResult
$Res call({
 String languageCode
});




}
/// @nodoc
class _$SettingsLanguageChangedCopyWithImpl<$Res>
    implements $SettingsLanguageChangedCopyWith<$Res> {
  _$SettingsLanguageChangedCopyWithImpl(this._self, this._then);

  final SettingsLanguageChanged _self;
  final $Res Function(SettingsLanguageChanged) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? languageCode = null,}) {
  return _then(SettingsLanguageChanged(
languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SettingsUnitChanged implements SettingsEvent {
  const SettingsUnitChanged({required this.useCelsius});
  

 final  bool useCelsius;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsUnitChangedCopyWith<SettingsUnitChanged> get copyWith => _$SettingsUnitChangedCopyWithImpl<SettingsUnitChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsUnitChanged&&(identical(other.useCelsius, useCelsius) || other.useCelsius == useCelsius));
}


@override
int get hashCode => Object.hash(runtimeType,useCelsius);

@override
String toString() {
  return 'SettingsEvent.unitChanged(useCelsius: $useCelsius)';
}


}

/// @nodoc
abstract mixin class $SettingsUnitChangedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory $SettingsUnitChangedCopyWith(SettingsUnitChanged value, $Res Function(SettingsUnitChanged) _then) = _$SettingsUnitChangedCopyWithImpl;
@useResult
$Res call({
 bool useCelsius
});




}
/// @nodoc
class _$SettingsUnitChangedCopyWithImpl<$Res>
    implements $SettingsUnitChangedCopyWith<$Res> {
  _$SettingsUnitChangedCopyWithImpl(this._self, this._then);

  final SettingsUnitChanged _self;
  final $Res Function(SettingsUnitChanged) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? useCelsius = null,}) {
  return _then(SettingsUnitChanged(
useCelsius: null == useCelsius ? _self.useCelsius : useCelsius // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
