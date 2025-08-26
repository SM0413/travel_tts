// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_texts_list_main_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyTextsListMainPageModel {

 List<TextsModel> get deleteModelList; bool get isDelete; bool get isCheckAll;
/// Create a copy of MyTextsListMainPageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTextsListMainPageModelCopyWith<MyTextsListMainPageModel> get copyWith => _$MyTextsListMainPageModelCopyWithImpl<MyTextsListMainPageModel>(this as MyTextsListMainPageModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTextsListMainPageModel&&const DeepCollectionEquality().equals(other.deleteModelList, deleteModelList)&&(identical(other.isDelete, isDelete) || other.isDelete == isDelete)&&(identical(other.isCheckAll, isCheckAll) || other.isCheckAll == isCheckAll));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(deleteModelList),isDelete,isCheckAll);

@override
String toString() {
  return 'MyTextsListMainPageModel(deleteModelList: $deleteModelList, isDelete: $isDelete, isCheckAll: $isCheckAll)';
}


}

/// @nodoc
abstract mixin class $MyTextsListMainPageModelCopyWith<$Res>  {
  factory $MyTextsListMainPageModelCopyWith(MyTextsListMainPageModel value, $Res Function(MyTextsListMainPageModel) _then) = _$MyTextsListMainPageModelCopyWithImpl;
@useResult
$Res call({
 List<TextsModel> deleteModelList, bool isDelete, bool isCheckAll
});




}
/// @nodoc
class _$MyTextsListMainPageModelCopyWithImpl<$Res>
    implements $MyTextsListMainPageModelCopyWith<$Res> {
  _$MyTextsListMainPageModelCopyWithImpl(this._self, this._then);

  final MyTextsListMainPageModel _self;
  final $Res Function(MyTextsListMainPageModel) _then;

/// Create a copy of MyTextsListMainPageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deleteModelList = null,Object? isDelete = null,Object? isCheckAll = null,}) {
  return _then(_self.copyWith(
deleteModelList: null == deleteModelList ? _self.deleteModelList : deleteModelList // ignore: cast_nullable_to_non_nullable
as List<TextsModel>,isDelete: null == isDelete ? _self.isDelete : isDelete // ignore: cast_nullable_to_non_nullable
as bool,isCheckAll: null == isCheckAll ? _self.isCheckAll : isCheckAll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MyTextsListMainPageModel].
extension MyTextsListMainPageModelPatterns on MyTextsListMainPageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyTextsListMainPageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyTextsListMainPageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyTextsListMainPageModel value)  $default,){
final _that = this;
switch (_that) {
case _MyTextsListMainPageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyTextsListMainPageModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyTextsListMainPageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TextsModel> deleteModelList,  bool isDelete,  bool isCheckAll)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyTextsListMainPageModel() when $default != null:
return $default(_that.deleteModelList,_that.isDelete,_that.isCheckAll);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TextsModel> deleteModelList,  bool isDelete,  bool isCheckAll)  $default,) {final _that = this;
switch (_that) {
case _MyTextsListMainPageModel():
return $default(_that.deleteModelList,_that.isDelete,_that.isCheckAll);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TextsModel> deleteModelList,  bool isDelete,  bool isCheckAll)?  $default,) {final _that = this;
switch (_that) {
case _MyTextsListMainPageModel() when $default != null:
return $default(_that.deleteModelList,_that.isDelete,_that.isCheckAll);case _:
  return null;

}
}

}

/// @nodoc


class _MyTextsListMainPageModel implements MyTextsListMainPageModel {
  const _MyTextsListMainPageModel({final  List<TextsModel> deleteModelList = const [], this.isDelete = false, this.isCheckAll = false}): _deleteModelList = deleteModelList;
  

 final  List<TextsModel> _deleteModelList;
@override@JsonKey() List<TextsModel> get deleteModelList {
  if (_deleteModelList is EqualUnmodifiableListView) return _deleteModelList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deleteModelList);
}

@override@JsonKey() final  bool isDelete;
@override@JsonKey() final  bool isCheckAll;

/// Create a copy of MyTextsListMainPageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyTextsListMainPageModelCopyWith<_MyTextsListMainPageModel> get copyWith => __$MyTextsListMainPageModelCopyWithImpl<_MyTextsListMainPageModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyTextsListMainPageModel&&const DeepCollectionEquality().equals(other._deleteModelList, _deleteModelList)&&(identical(other.isDelete, isDelete) || other.isDelete == isDelete)&&(identical(other.isCheckAll, isCheckAll) || other.isCheckAll == isCheckAll));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deleteModelList),isDelete,isCheckAll);

@override
String toString() {
  return 'MyTextsListMainPageModel(deleteModelList: $deleteModelList, isDelete: $isDelete, isCheckAll: $isCheckAll)';
}


}

/// @nodoc
abstract mixin class _$MyTextsListMainPageModelCopyWith<$Res> implements $MyTextsListMainPageModelCopyWith<$Res> {
  factory _$MyTextsListMainPageModelCopyWith(_MyTextsListMainPageModel value, $Res Function(_MyTextsListMainPageModel) _then) = __$MyTextsListMainPageModelCopyWithImpl;
@override @useResult
$Res call({
 List<TextsModel> deleteModelList, bool isDelete, bool isCheckAll
});




}
/// @nodoc
class __$MyTextsListMainPageModelCopyWithImpl<$Res>
    implements _$MyTextsListMainPageModelCopyWith<$Res> {
  __$MyTextsListMainPageModelCopyWithImpl(this._self, this._then);

  final _MyTextsListMainPageModel _self;
  final $Res Function(_MyTextsListMainPageModel) _then;

/// Create a copy of MyTextsListMainPageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deleteModelList = null,Object? isDelete = null,Object? isCheckAll = null,}) {
  return _then(_MyTextsListMainPageModel(
deleteModelList: null == deleteModelList ? _self._deleteModelList : deleteModelList // ignore: cast_nullable_to_non_nullable
as List<TextsModel>,isDelete: null == isDelete ? _self.isDelete : isDelete // ignore: cast_nullable_to_non_nullable
as bool,isCheckAll: null == isCheckAll ? _self.isCheckAll : isCheckAll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
