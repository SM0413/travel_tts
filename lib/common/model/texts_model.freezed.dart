// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'texts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextsModel {

 String get id; String get source; String get target; String get sourceLocale; String get targetLocale; List<String> get tags; String get userId; double get pitchSpeed; bool get isShare;@JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? get createdAt;@JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? get updatedAt;
/// Create a copy of TextsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextsModelCopyWith<TextsModel> get copyWith => _$TextsModelCopyWithImpl<TextsModel>(this as TextsModel, _$identity);

  /// Serializes this TextsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.target, target) || other.target == target)&&(identical(other.sourceLocale, sourceLocale) || other.sourceLocale == sourceLocale)&&(identical(other.targetLocale, targetLocale) || other.targetLocale == targetLocale)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pitchSpeed, pitchSpeed) || other.pitchSpeed == pitchSpeed)&&(identical(other.isShare, isShare) || other.isShare == isShare)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,source,target,sourceLocale,targetLocale,const DeepCollectionEquality().hash(tags),userId,pitchSpeed,isShare,createdAt,updatedAt);

@override
String toString() {
  return 'TextsModel(id: $id, source: $source, target: $target, sourceLocale: $sourceLocale, targetLocale: $targetLocale, tags: $tags, userId: $userId, pitchSpeed: $pitchSpeed, isShare: $isShare, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TextsModelCopyWith<$Res>  {
  factory $TextsModelCopyWith(TextsModel value, $Res Function(TextsModel) _then) = _$TextsModelCopyWithImpl;
@useResult
$Res call({
 String id, String source, String target, String sourceLocale, String targetLocale, List<String> tags, String userId, double pitchSpeed, bool isShare,@JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? createdAt,@JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? updatedAt
});




}
/// @nodoc
class _$TextsModelCopyWithImpl<$Res>
    implements $TextsModelCopyWith<$Res> {
  _$TextsModelCopyWithImpl(this._self, this._then);

  final TextsModel _self;
  final $Res Function(TextsModel) _then;

/// Create a copy of TextsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? source = null,Object? target = null,Object? sourceLocale = null,Object? targetLocale = null,Object? tags = null,Object? userId = null,Object? pitchSpeed = null,Object? isShare = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,sourceLocale: null == sourceLocale ? _self.sourceLocale : sourceLocale // ignore: cast_nullable_to_non_nullable
as String,targetLocale: null == targetLocale ? _self.targetLocale : targetLocale // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pitchSpeed: null == pitchSpeed ? _self.pitchSpeed : pitchSpeed // ignore: cast_nullable_to_non_nullable
as double,isShare: null == isShare ? _self.isShare : isShare // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TextsModel].
extension TextsModelPatterns on TextsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextsModel value)  $default,){
final _that = this;
switch (_that) {
case _TextsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextsModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String source,  String target,  String sourceLocale,  String targetLocale,  List<String> tags,  String userId,  double pitchSpeed,  bool isShare, @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp)  DateTime? createdAt, @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextsModel() when $default != null:
return $default(_that.id,_that.source,_that.target,_that.sourceLocale,_that.targetLocale,_that.tags,_that.userId,_that.pitchSpeed,_that.isShare,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String source,  String target,  String sourceLocale,  String targetLocale,  List<String> tags,  String userId,  double pitchSpeed,  bool isShare, @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp)  DateTime? createdAt, @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TextsModel():
return $default(_that.id,_that.source,_that.target,_that.sourceLocale,_that.targetLocale,_that.tags,_that.userId,_that.pitchSpeed,_that.isShare,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String source,  String target,  String sourceLocale,  String targetLocale,  List<String> tags,  String userId,  double pitchSpeed,  bool isShare, @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp)  DateTime? createdAt, @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TextsModel() when $default != null:
return $default(_that.id,_that.source,_that.target,_that.sourceLocale,_that.targetLocale,_that.tags,_that.userId,_that.pitchSpeed,_that.isShare,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextsModel implements TextsModel {
  const _TextsModel({this.id = "", this.source = "", this.target = "", this.sourceLocale = "", this.targetLocale = "", final  List<String> tags = const [], this.userId = "", this.pitchSpeed = 1, this.isShare = false, @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) this.createdAt, @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) this.updatedAt}): _tags = tags;
  factory _TextsModel.fromJson(Map<String, dynamic> json) => _$TextsModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String source;
@override@JsonKey() final  String target;
@override@JsonKey() final  String sourceLocale;
@override@JsonKey() final  String targetLocale;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  String userId;
@override@JsonKey() final  double pitchSpeed;
@override@JsonKey() final  bool isShare;
@override@JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) final  DateTime? createdAt;
@override@JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) final  DateTime? updatedAt;

/// Create a copy of TextsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextsModelCopyWith<_TextsModel> get copyWith => __$TextsModelCopyWithImpl<_TextsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.target, target) || other.target == target)&&(identical(other.sourceLocale, sourceLocale) || other.sourceLocale == sourceLocale)&&(identical(other.targetLocale, targetLocale) || other.targetLocale == targetLocale)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pitchSpeed, pitchSpeed) || other.pitchSpeed == pitchSpeed)&&(identical(other.isShare, isShare) || other.isShare == isShare)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,source,target,sourceLocale,targetLocale,const DeepCollectionEquality().hash(_tags),userId,pitchSpeed,isShare,createdAt,updatedAt);

@override
String toString() {
  return 'TextsModel(id: $id, source: $source, target: $target, sourceLocale: $sourceLocale, targetLocale: $targetLocale, tags: $tags, userId: $userId, pitchSpeed: $pitchSpeed, isShare: $isShare, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TextsModelCopyWith<$Res> implements $TextsModelCopyWith<$Res> {
  factory _$TextsModelCopyWith(_TextsModel value, $Res Function(_TextsModel) _then) = __$TextsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String source, String target, String sourceLocale, String targetLocale, List<String> tags, String userId, double pitchSpeed, bool isShare,@JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? createdAt,@JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? updatedAt
});




}
/// @nodoc
class __$TextsModelCopyWithImpl<$Res>
    implements _$TextsModelCopyWith<$Res> {
  __$TextsModelCopyWithImpl(this._self, this._then);

  final _TextsModel _self;
  final $Res Function(_TextsModel) _then;

/// Create a copy of TextsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? source = null,Object? target = null,Object? sourceLocale = null,Object? targetLocale = null,Object? tags = null,Object? userId = null,Object? pitchSpeed = null,Object? isShare = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TextsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,sourceLocale: null == sourceLocale ? _self.sourceLocale : sourceLocale // ignore: cast_nullable_to_non_nullable
as String,targetLocale: null == targetLocale ? _self.targetLocale : targetLocale // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pitchSpeed: null == pitchSpeed ? _self.pitchSpeed : pitchSpeed // ignore: cast_nullable_to_non_nullable
as double,isShare: null == isShare ? _self.isShare : isShare // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
