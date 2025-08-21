// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalDbModel {

 List<TextsModel> get texts; List<String> get downloadedLangPack;
/// Create a copy of LocalDbModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalDbModelCopyWith<LocalDbModel> get copyWith => _$LocalDbModelCopyWithImpl<LocalDbModel>(this as LocalDbModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalDbModel&&const DeepCollectionEquality().equals(other.texts, texts)&&const DeepCollectionEquality().equals(other.downloadedLangPack, downloadedLangPack));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(texts),const DeepCollectionEquality().hash(downloadedLangPack));

@override
String toString() {
  return 'LocalDbModel(texts: $texts, downloadedLangPack: $downloadedLangPack)';
}


}

/// @nodoc
abstract mixin class $LocalDbModelCopyWith<$Res>  {
  factory $LocalDbModelCopyWith(LocalDbModel value, $Res Function(LocalDbModel) _then) = _$LocalDbModelCopyWithImpl;
@useResult
$Res call({
 List<TextsModel> texts, List<String> downloadedLangPack
});




}
/// @nodoc
class _$LocalDbModelCopyWithImpl<$Res>
    implements $LocalDbModelCopyWith<$Res> {
  _$LocalDbModelCopyWithImpl(this._self, this._then);

  final LocalDbModel _self;
  final $Res Function(LocalDbModel) _then;

/// Create a copy of LocalDbModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? texts = null,Object? downloadedLangPack = null,}) {
  return _then(_self.copyWith(
texts: null == texts ? _self.texts : texts // ignore: cast_nullable_to_non_nullable
as List<TextsModel>,downloadedLangPack: null == downloadedLangPack ? _self.downloadedLangPack : downloadedLangPack // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalDbModel].
extension LocalDbModelPatterns on LocalDbModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalDbModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalDbModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalDbModel value)  $default,){
final _that = this;
switch (_that) {
case _LocalDbModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalDbModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocalDbModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TextsModel> texts,  List<String> downloadedLangPack)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalDbModel() when $default != null:
return $default(_that.texts,_that.downloadedLangPack);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TextsModel> texts,  List<String> downloadedLangPack)  $default,) {final _that = this;
switch (_that) {
case _LocalDbModel():
return $default(_that.texts,_that.downloadedLangPack);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TextsModel> texts,  List<String> downloadedLangPack)?  $default,) {final _that = this;
switch (_that) {
case _LocalDbModel() when $default != null:
return $default(_that.texts,_that.downloadedLangPack);case _:
  return null;

}
}

}

/// @nodoc


class _LocalDbModel implements LocalDbModel {
  const _LocalDbModel({final  List<TextsModel> texts = const [], final  List<String> downloadedLangPack = const ["한국어", "영어"]}): _texts = texts,_downloadedLangPack = downloadedLangPack;
  

 final  List<TextsModel> _texts;
@override@JsonKey() List<TextsModel> get texts {
  if (_texts is EqualUnmodifiableListView) return _texts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_texts);
}

 final  List<String> _downloadedLangPack;
@override@JsonKey() List<String> get downloadedLangPack {
  if (_downloadedLangPack is EqualUnmodifiableListView) return _downloadedLangPack;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_downloadedLangPack);
}


/// Create a copy of LocalDbModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalDbModelCopyWith<_LocalDbModel> get copyWith => __$LocalDbModelCopyWithImpl<_LocalDbModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalDbModel&&const DeepCollectionEquality().equals(other._texts, _texts)&&const DeepCollectionEquality().equals(other._downloadedLangPack, _downloadedLangPack));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_texts),const DeepCollectionEquality().hash(_downloadedLangPack));

@override
String toString() {
  return 'LocalDbModel(texts: $texts, downloadedLangPack: $downloadedLangPack)';
}


}

/// @nodoc
abstract mixin class _$LocalDbModelCopyWith<$Res> implements $LocalDbModelCopyWith<$Res> {
  factory _$LocalDbModelCopyWith(_LocalDbModel value, $Res Function(_LocalDbModel) _then) = __$LocalDbModelCopyWithImpl;
@override @useResult
$Res call({
 List<TextsModel> texts, List<String> downloadedLangPack
});




}
/// @nodoc
class __$LocalDbModelCopyWithImpl<$Res>
    implements _$LocalDbModelCopyWith<$Res> {
  __$LocalDbModelCopyWithImpl(this._self, this._then);

  final _LocalDbModel _self;
  final $Res Function(_LocalDbModel) _then;

/// Create a copy of LocalDbModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? texts = null,Object? downloadedLangPack = null,}) {
  return _then(_LocalDbModel(
texts: null == texts ? _self._texts : texts // ignore: cast_nullable_to_non_nullable
as List<TextsModel>,downloadedLangPack: null == downloadedLangPack ? _self._downloadedLangPack : downloadedLangPack // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
