// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_texts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadTextsModel {

 TextEditingController get sourceController; TextEditingController get targetController; TextEditingController get localeController; TextEditingController get tagController; FocusNode get sourceFocus; FocusNode get targetFocus; FocusNode get localeFocus; FocusNode get tagFocus; GlobalKey<FormBuilderState> get formKey; GlobalKey<FormBuilderFieldState> get sourceKey; GlobalKey<FormBuilderFieldState> get targetKey; GlobalKey<FormBuilderFieldState> get sourceLocaleKey; GlobalKey<FormBuilderFieldState> get targetLocaleKey; GlobalKey<FormBuilderFieldState> get pitchSpeedKey; GlobalKey<FormBuilderFieldState> get tagKey; GlobalKey<FormBuilderFieldState> get shareKey; TranslateLanguage get sourceTransLang; TranslateLanguage get targetTransLang; bool get isFinished; bool get initShareValue; String get initTargetLocaleValue; double get initPitchSpeedValue; List<String> get tags;
/// Create a copy of UploadTextsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadTextsModelCopyWith<UploadTextsModel> get copyWith => _$UploadTextsModelCopyWithImpl<UploadTextsModel>(this as UploadTextsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadTextsModel&&(identical(other.sourceController, sourceController) || other.sourceController == sourceController)&&(identical(other.targetController, targetController) || other.targetController == targetController)&&(identical(other.localeController, localeController) || other.localeController == localeController)&&(identical(other.tagController, tagController) || other.tagController == tagController)&&(identical(other.sourceFocus, sourceFocus) || other.sourceFocus == sourceFocus)&&(identical(other.targetFocus, targetFocus) || other.targetFocus == targetFocus)&&(identical(other.localeFocus, localeFocus) || other.localeFocus == localeFocus)&&(identical(other.tagFocus, tagFocus) || other.tagFocus == tagFocus)&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.sourceKey, sourceKey) || other.sourceKey == sourceKey)&&(identical(other.targetKey, targetKey) || other.targetKey == targetKey)&&(identical(other.sourceLocaleKey, sourceLocaleKey) || other.sourceLocaleKey == sourceLocaleKey)&&(identical(other.targetLocaleKey, targetLocaleKey) || other.targetLocaleKey == targetLocaleKey)&&(identical(other.pitchSpeedKey, pitchSpeedKey) || other.pitchSpeedKey == pitchSpeedKey)&&(identical(other.tagKey, tagKey) || other.tagKey == tagKey)&&(identical(other.shareKey, shareKey) || other.shareKey == shareKey)&&(identical(other.sourceTransLang, sourceTransLang) || other.sourceTransLang == sourceTransLang)&&(identical(other.targetTransLang, targetTransLang) || other.targetTransLang == targetTransLang)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.initShareValue, initShareValue) || other.initShareValue == initShareValue)&&(identical(other.initTargetLocaleValue, initTargetLocaleValue) || other.initTargetLocaleValue == initTargetLocaleValue)&&(identical(other.initPitchSpeedValue, initPitchSpeedValue) || other.initPitchSpeedValue == initPitchSpeedValue)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hashAll([runtimeType,sourceController,targetController,localeController,tagController,sourceFocus,targetFocus,localeFocus,tagFocus,formKey,sourceKey,targetKey,sourceLocaleKey,targetLocaleKey,pitchSpeedKey,tagKey,shareKey,sourceTransLang,targetTransLang,isFinished,initShareValue,initTargetLocaleValue,initPitchSpeedValue,const DeepCollectionEquality().hash(tags)]);

@override
String toString() {
  return 'UploadTextsModel(sourceController: $sourceController, targetController: $targetController, localeController: $localeController, tagController: $tagController, sourceFocus: $sourceFocus, targetFocus: $targetFocus, localeFocus: $localeFocus, tagFocus: $tagFocus, formKey: $formKey, sourceKey: $sourceKey, targetKey: $targetKey, sourceLocaleKey: $sourceLocaleKey, targetLocaleKey: $targetLocaleKey, pitchSpeedKey: $pitchSpeedKey, tagKey: $tagKey, shareKey: $shareKey, sourceTransLang: $sourceTransLang, targetTransLang: $targetTransLang, isFinished: $isFinished, initShareValue: $initShareValue, initTargetLocaleValue: $initTargetLocaleValue, initPitchSpeedValue: $initPitchSpeedValue, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $UploadTextsModelCopyWith<$Res>  {
  factory $UploadTextsModelCopyWith(UploadTextsModel value, $Res Function(UploadTextsModel) _then) = _$UploadTextsModelCopyWithImpl;
@useResult
$Res call({
 TextEditingController sourceController, TextEditingController targetController, TextEditingController localeController, TextEditingController tagController, FocusNode sourceFocus, FocusNode targetFocus, FocusNode localeFocus, FocusNode tagFocus, GlobalKey<FormBuilderState> formKey, GlobalKey<FormBuilderFieldState> sourceKey, GlobalKey<FormBuilderFieldState> targetKey, GlobalKey<FormBuilderFieldState> sourceLocaleKey, GlobalKey<FormBuilderFieldState> targetLocaleKey, GlobalKey<FormBuilderFieldState> pitchSpeedKey, GlobalKey<FormBuilderFieldState> tagKey, GlobalKey<FormBuilderFieldState> shareKey, TranslateLanguage sourceTransLang, TranslateLanguage targetTransLang, bool isFinished, bool initShareValue, String initTargetLocaleValue, double initPitchSpeedValue, List<String> tags
});




}
/// @nodoc
class _$UploadTextsModelCopyWithImpl<$Res>
    implements $UploadTextsModelCopyWith<$Res> {
  _$UploadTextsModelCopyWithImpl(this._self, this._then);

  final UploadTextsModel _self;
  final $Res Function(UploadTextsModel) _then;

/// Create a copy of UploadTextsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceController = null,Object? targetController = null,Object? localeController = null,Object? tagController = null,Object? sourceFocus = null,Object? targetFocus = null,Object? localeFocus = null,Object? tagFocus = null,Object? formKey = null,Object? sourceKey = null,Object? targetKey = null,Object? sourceLocaleKey = null,Object? targetLocaleKey = null,Object? pitchSpeedKey = null,Object? tagKey = null,Object? shareKey = null,Object? sourceTransLang = null,Object? targetTransLang = null,Object? isFinished = null,Object? initShareValue = null,Object? initTargetLocaleValue = null,Object? initPitchSpeedValue = null,Object? tags = null,}) {
  return _then(_self.copyWith(
sourceController: null == sourceController ? _self.sourceController : sourceController // ignore: cast_nullable_to_non_nullable
as TextEditingController,targetController: null == targetController ? _self.targetController : targetController // ignore: cast_nullable_to_non_nullable
as TextEditingController,localeController: null == localeController ? _self.localeController : localeController // ignore: cast_nullable_to_non_nullable
as TextEditingController,tagController: null == tagController ? _self.tagController : tagController // ignore: cast_nullable_to_non_nullable
as TextEditingController,sourceFocus: null == sourceFocus ? _self.sourceFocus : sourceFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,targetFocus: null == targetFocus ? _self.targetFocus : targetFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,localeFocus: null == localeFocus ? _self.localeFocus : localeFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,tagFocus: null == tagFocus ? _self.tagFocus : tagFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderState>,sourceKey: null == sourceKey ? _self.sourceKey : sourceKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,targetKey: null == targetKey ? _self.targetKey : targetKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,sourceLocaleKey: null == sourceLocaleKey ? _self.sourceLocaleKey : sourceLocaleKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,targetLocaleKey: null == targetLocaleKey ? _self.targetLocaleKey : targetLocaleKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,pitchSpeedKey: null == pitchSpeedKey ? _self.pitchSpeedKey : pitchSpeedKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,tagKey: null == tagKey ? _self.tagKey : tagKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,shareKey: null == shareKey ? _self.shareKey : shareKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,sourceTransLang: null == sourceTransLang ? _self.sourceTransLang : sourceTransLang // ignore: cast_nullable_to_non_nullable
as TranslateLanguage,targetTransLang: null == targetTransLang ? _self.targetTransLang : targetTransLang // ignore: cast_nullable_to_non_nullable
as TranslateLanguage,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,initShareValue: null == initShareValue ? _self.initShareValue : initShareValue // ignore: cast_nullable_to_non_nullable
as bool,initTargetLocaleValue: null == initTargetLocaleValue ? _self.initTargetLocaleValue : initTargetLocaleValue // ignore: cast_nullable_to_non_nullable
as String,initPitchSpeedValue: null == initPitchSpeedValue ? _self.initPitchSpeedValue : initPitchSpeedValue // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadTextsModel].
extension UploadTextsModelPatterns on UploadTextsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadTextsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadTextsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadTextsModel value)  $default,){
final _that = this;
switch (_that) {
case _UploadTextsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadTextsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UploadTextsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TextEditingController sourceController,  TextEditingController targetController,  TextEditingController localeController,  TextEditingController tagController,  FocusNode sourceFocus,  FocusNode targetFocus,  FocusNode localeFocus,  FocusNode tagFocus,  GlobalKey<FormBuilderState> formKey,  GlobalKey<FormBuilderFieldState> sourceKey,  GlobalKey<FormBuilderFieldState> targetKey,  GlobalKey<FormBuilderFieldState> sourceLocaleKey,  GlobalKey<FormBuilderFieldState> targetLocaleKey,  GlobalKey<FormBuilderFieldState> pitchSpeedKey,  GlobalKey<FormBuilderFieldState> tagKey,  GlobalKey<FormBuilderFieldState> shareKey,  TranslateLanguage sourceTransLang,  TranslateLanguage targetTransLang,  bool isFinished,  bool initShareValue,  String initTargetLocaleValue,  double initPitchSpeedValue,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadTextsModel() when $default != null:
return $default(_that.sourceController,_that.targetController,_that.localeController,_that.tagController,_that.sourceFocus,_that.targetFocus,_that.localeFocus,_that.tagFocus,_that.formKey,_that.sourceKey,_that.targetKey,_that.sourceLocaleKey,_that.targetLocaleKey,_that.pitchSpeedKey,_that.tagKey,_that.shareKey,_that.sourceTransLang,_that.targetTransLang,_that.isFinished,_that.initShareValue,_that.initTargetLocaleValue,_that.initPitchSpeedValue,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TextEditingController sourceController,  TextEditingController targetController,  TextEditingController localeController,  TextEditingController tagController,  FocusNode sourceFocus,  FocusNode targetFocus,  FocusNode localeFocus,  FocusNode tagFocus,  GlobalKey<FormBuilderState> formKey,  GlobalKey<FormBuilderFieldState> sourceKey,  GlobalKey<FormBuilderFieldState> targetKey,  GlobalKey<FormBuilderFieldState> sourceLocaleKey,  GlobalKey<FormBuilderFieldState> targetLocaleKey,  GlobalKey<FormBuilderFieldState> pitchSpeedKey,  GlobalKey<FormBuilderFieldState> tagKey,  GlobalKey<FormBuilderFieldState> shareKey,  TranslateLanguage sourceTransLang,  TranslateLanguage targetTransLang,  bool isFinished,  bool initShareValue,  String initTargetLocaleValue,  double initPitchSpeedValue,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _UploadTextsModel():
return $default(_that.sourceController,_that.targetController,_that.localeController,_that.tagController,_that.sourceFocus,_that.targetFocus,_that.localeFocus,_that.tagFocus,_that.formKey,_that.sourceKey,_that.targetKey,_that.sourceLocaleKey,_that.targetLocaleKey,_that.pitchSpeedKey,_that.tagKey,_that.shareKey,_that.sourceTransLang,_that.targetTransLang,_that.isFinished,_that.initShareValue,_that.initTargetLocaleValue,_that.initPitchSpeedValue,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TextEditingController sourceController,  TextEditingController targetController,  TextEditingController localeController,  TextEditingController tagController,  FocusNode sourceFocus,  FocusNode targetFocus,  FocusNode localeFocus,  FocusNode tagFocus,  GlobalKey<FormBuilderState> formKey,  GlobalKey<FormBuilderFieldState> sourceKey,  GlobalKey<FormBuilderFieldState> targetKey,  GlobalKey<FormBuilderFieldState> sourceLocaleKey,  GlobalKey<FormBuilderFieldState> targetLocaleKey,  GlobalKey<FormBuilderFieldState> pitchSpeedKey,  GlobalKey<FormBuilderFieldState> tagKey,  GlobalKey<FormBuilderFieldState> shareKey,  TranslateLanguage sourceTransLang,  TranslateLanguage targetTransLang,  bool isFinished,  bool initShareValue,  String initTargetLocaleValue,  double initPitchSpeedValue,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _UploadTextsModel() when $default != null:
return $default(_that.sourceController,_that.targetController,_that.localeController,_that.tagController,_that.sourceFocus,_that.targetFocus,_that.localeFocus,_that.tagFocus,_that.formKey,_that.sourceKey,_that.targetKey,_that.sourceLocaleKey,_that.targetLocaleKey,_that.pitchSpeedKey,_that.tagKey,_that.shareKey,_that.sourceTransLang,_that.targetTransLang,_that.isFinished,_that.initShareValue,_that.initTargetLocaleValue,_that.initPitchSpeedValue,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _UploadTextsModel implements UploadTextsModel {
  const _UploadTextsModel({required this.sourceController, required this.targetController, required this.localeController, required this.tagController, required this.sourceFocus, required this.targetFocus, required this.localeFocus, required this.tagFocus, required this.formKey, required this.sourceKey, required this.targetKey, required this.sourceLocaleKey, required this.targetLocaleKey, required this.pitchSpeedKey, required this.tagKey, required this.shareKey, required this.sourceTransLang, required this.targetTransLang, this.isFinished = false, this.initShareValue = false, this.initTargetLocaleValue = "영어", this.initPitchSpeedValue = 1.0, final  List<String> tags = const []}): _tags = tags;
  

@override final  TextEditingController sourceController;
@override final  TextEditingController targetController;
@override final  TextEditingController localeController;
@override final  TextEditingController tagController;
@override final  FocusNode sourceFocus;
@override final  FocusNode targetFocus;
@override final  FocusNode localeFocus;
@override final  FocusNode tagFocus;
@override final  GlobalKey<FormBuilderState> formKey;
@override final  GlobalKey<FormBuilderFieldState> sourceKey;
@override final  GlobalKey<FormBuilderFieldState> targetKey;
@override final  GlobalKey<FormBuilderFieldState> sourceLocaleKey;
@override final  GlobalKey<FormBuilderFieldState> targetLocaleKey;
@override final  GlobalKey<FormBuilderFieldState> pitchSpeedKey;
@override final  GlobalKey<FormBuilderFieldState> tagKey;
@override final  GlobalKey<FormBuilderFieldState> shareKey;
@override final  TranslateLanguage sourceTransLang;
@override final  TranslateLanguage targetTransLang;
@override@JsonKey() final  bool isFinished;
@override@JsonKey() final  bool initShareValue;
@override@JsonKey() final  String initTargetLocaleValue;
@override@JsonKey() final  double initPitchSpeedValue;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of UploadTextsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadTextsModelCopyWith<_UploadTextsModel> get copyWith => __$UploadTextsModelCopyWithImpl<_UploadTextsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadTextsModel&&(identical(other.sourceController, sourceController) || other.sourceController == sourceController)&&(identical(other.targetController, targetController) || other.targetController == targetController)&&(identical(other.localeController, localeController) || other.localeController == localeController)&&(identical(other.tagController, tagController) || other.tagController == tagController)&&(identical(other.sourceFocus, sourceFocus) || other.sourceFocus == sourceFocus)&&(identical(other.targetFocus, targetFocus) || other.targetFocus == targetFocus)&&(identical(other.localeFocus, localeFocus) || other.localeFocus == localeFocus)&&(identical(other.tagFocus, tagFocus) || other.tagFocus == tagFocus)&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.sourceKey, sourceKey) || other.sourceKey == sourceKey)&&(identical(other.targetKey, targetKey) || other.targetKey == targetKey)&&(identical(other.sourceLocaleKey, sourceLocaleKey) || other.sourceLocaleKey == sourceLocaleKey)&&(identical(other.targetLocaleKey, targetLocaleKey) || other.targetLocaleKey == targetLocaleKey)&&(identical(other.pitchSpeedKey, pitchSpeedKey) || other.pitchSpeedKey == pitchSpeedKey)&&(identical(other.tagKey, tagKey) || other.tagKey == tagKey)&&(identical(other.shareKey, shareKey) || other.shareKey == shareKey)&&(identical(other.sourceTransLang, sourceTransLang) || other.sourceTransLang == sourceTransLang)&&(identical(other.targetTransLang, targetTransLang) || other.targetTransLang == targetTransLang)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.initShareValue, initShareValue) || other.initShareValue == initShareValue)&&(identical(other.initTargetLocaleValue, initTargetLocaleValue) || other.initTargetLocaleValue == initTargetLocaleValue)&&(identical(other.initPitchSpeedValue, initPitchSpeedValue) || other.initPitchSpeedValue == initPitchSpeedValue)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hashAll([runtimeType,sourceController,targetController,localeController,tagController,sourceFocus,targetFocus,localeFocus,tagFocus,formKey,sourceKey,targetKey,sourceLocaleKey,targetLocaleKey,pitchSpeedKey,tagKey,shareKey,sourceTransLang,targetTransLang,isFinished,initShareValue,initTargetLocaleValue,initPitchSpeedValue,const DeepCollectionEquality().hash(_tags)]);

@override
String toString() {
  return 'UploadTextsModel(sourceController: $sourceController, targetController: $targetController, localeController: $localeController, tagController: $tagController, sourceFocus: $sourceFocus, targetFocus: $targetFocus, localeFocus: $localeFocus, tagFocus: $tagFocus, formKey: $formKey, sourceKey: $sourceKey, targetKey: $targetKey, sourceLocaleKey: $sourceLocaleKey, targetLocaleKey: $targetLocaleKey, pitchSpeedKey: $pitchSpeedKey, tagKey: $tagKey, shareKey: $shareKey, sourceTransLang: $sourceTransLang, targetTransLang: $targetTransLang, isFinished: $isFinished, initShareValue: $initShareValue, initTargetLocaleValue: $initTargetLocaleValue, initPitchSpeedValue: $initPitchSpeedValue, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$UploadTextsModelCopyWith<$Res> implements $UploadTextsModelCopyWith<$Res> {
  factory _$UploadTextsModelCopyWith(_UploadTextsModel value, $Res Function(_UploadTextsModel) _then) = __$UploadTextsModelCopyWithImpl;
@override @useResult
$Res call({
 TextEditingController sourceController, TextEditingController targetController, TextEditingController localeController, TextEditingController tagController, FocusNode sourceFocus, FocusNode targetFocus, FocusNode localeFocus, FocusNode tagFocus, GlobalKey<FormBuilderState> formKey, GlobalKey<FormBuilderFieldState> sourceKey, GlobalKey<FormBuilderFieldState> targetKey, GlobalKey<FormBuilderFieldState> sourceLocaleKey, GlobalKey<FormBuilderFieldState> targetLocaleKey, GlobalKey<FormBuilderFieldState> pitchSpeedKey, GlobalKey<FormBuilderFieldState> tagKey, GlobalKey<FormBuilderFieldState> shareKey, TranslateLanguage sourceTransLang, TranslateLanguage targetTransLang, bool isFinished, bool initShareValue, String initTargetLocaleValue, double initPitchSpeedValue, List<String> tags
});




}
/// @nodoc
class __$UploadTextsModelCopyWithImpl<$Res>
    implements _$UploadTextsModelCopyWith<$Res> {
  __$UploadTextsModelCopyWithImpl(this._self, this._then);

  final _UploadTextsModel _self;
  final $Res Function(_UploadTextsModel) _then;

/// Create a copy of UploadTextsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceController = null,Object? targetController = null,Object? localeController = null,Object? tagController = null,Object? sourceFocus = null,Object? targetFocus = null,Object? localeFocus = null,Object? tagFocus = null,Object? formKey = null,Object? sourceKey = null,Object? targetKey = null,Object? sourceLocaleKey = null,Object? targetLocaleKey = null,Object? pitchSpeedKey = null,Object? tagKey = null,Object? shareKey = null,Object? sourceTransLang = null,Object? targetTransLang = null,Object? isFinished = null,Object? initShareValue = null,Object? initTargetLocaleValue = null,Object? initPitchSpeedValue = null,Object? tags = null,}) {
  return _then(_UploadTextsModel(
sourceController: null == sourceController ? _self.sourceController : sourceController // ignore: cast_nullable_to_non_nullable
as TextEditingController,targetController: null == targetController ? _self.targetController : targetController // ignore: cast_nullable_to_non_nullable
as TextEditingController,localeController: null == localeController ? _self.localeController : localeController // ignore: cast_nullable_to_non_nullable
as TextEditingController,tagController: null == tagController ? _self.tagController : tagController // ignore: cast_nullable_to_non_nullable
as TextEditingController,sourceFocus: null == sourceFocus ? _self.sourceFocus : sourceFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,targetFocus: null == targetFocus ? _self.targetFocus : targetFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,localeFocus: null == localeFocus ? _self.localeFocus : localeFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,tagFocus: null == tagFocus ? _self.tagFocus : tagFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderState>,sourceKey: null == sourceKey ? _self.sourceKey : sourceKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,targetKey: null == targetKey ? _self.targetKey : targetKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,sourceLocaleKey: null == sourceLocaleKey ? _self.sourceLocaleKey : sourceLocaleKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,targetLocaleKey: null == targetLocaleKey ? _self.targetLocaleKey : targetLocaleKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,pitchSpeedKey: null == pitchSpeedKey ? _self.pitchSpeedKey : pitchSpeedKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,tagKey: null == tagKey ? _self.tagKey : tagKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,shareKey: null == shareKey ? _self.shareKey : shareKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormBuilderFieldState>,sourceTransLang: null == sourceTransLang ? _self.sourceTransLang : sourceTransLang // ignore: cast_nullable_to_non_nullable
as TranslateLanguage,targetTransLang: null == targetTransLang ? _self.targetTransLang : targetTransLang // ignore: cast_nullable_to_non_nullable
as TranslateLanguage,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,initShareValue: null == initShareValue ? _self.initShareValue : initShareValue // ignore: cast_nullable_to_non_nullable
as bool,initTargetLocaleValue: null == initTargetLocaleValue ? _self.initTargetLocaleValue : initTargetLocaleValue // ignore: cast_nullable_to_non_nullable
as String,initPitchSpeedValue: null == initPitchSpeedValue ? _self.initPitchSpeedValue : initPitchSpeedValue // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
