// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainPageModel {

 TextEditingController get searchController; FocusNode get searchFocus; List<TextsModel> get myTexts;
/// Create a copy of MainPageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainPageModelCopyWith<MainPageModel> get copyWith => _$MainPageModelCopyWithImpl<MainPageModel>(this as MainPageModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainPageModel&&(identical(other.searchController, searchController) || other.searchController == searchController)&&(identical(other.searchFocus, searchFocus) || other.searchFocus == searchFocus)&&const DeepCollectionEquality().equals(other.myTexts, myTexts));
}


@override
int get hashCode => Object.hash(runtimeType,searchController,searchFocus,const DeepCollectionEquality().hash(myTexts));

@override
String toString() {
  return 'MainPageModel(searchController: $searchController, searchFocus: $searchFocus, myTexts: $myTexts)';
}


}

/// @nodoc
abstract mixin class $MainPageModelCopyWith<$Res>  {
  factory $MainPageModelCopyWith(MainPageModel value, $Res Function(MainPageModel) _then) = _$MainPageModelCopyWithImpl;
@useResult
$Res call({
 TextEditingController searchController, FocusNode searchFocus, List<TextsModel> myTexts
});




}
/// @nodoc
class _$MainPageModelCopyWithImpl<$Res>
    implements $MainPageModelCopyWith<$Res> {
  _$MainPageModelCopyWithImpl(this._self, this._then);

  final MainPageModel _self;
  final $Res Function(MainPageModel) _then;

/// Create a copy of MainPageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchController = null,Object? searchFocus = null,Object? myTexts = null,}) {
  return _then(_self.copyWith(
searchController: null == searchController ? _self.searchController : searchController // ignore: cast_nullable_to_non_nullable
as TextEditingController,searchFocus: null == searchFocus ? _self.searchFocus : searchFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,myTexts: null == myTexts ? _self.myTexts : myTexts // ignore: cast_nullable_to_non_nullable
as List<TextsModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MainPageModel].
extension MainPageModelPatterns on MainPageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainPageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainPageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainPageModel value)  $default,){
final _that = this;
switch (_that) {
case _MainPageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainPageModel value)?  $default,){
final _that = this;
switch (_that) {
case _MainPageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TextEditingController searchController,  FocusNode searchFocus,  List<TextsModel> myTexts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainPageModel() when $default != null:
return $default(_that.searchController,_that.searchFocus,_that.myTexts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TextEditingController searchController,  FocusNode searchFocus,  List<TextsModel> myTexts)  $default,) {final _that = this;
switch (_that) {
case _MainPageModel():
return $default(_that.searchController,_that.searchFocus,_that.myTexts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TextEditingController searchController,  FocusNode searchFocus,  List<TextsModel> myTexts)?  $default,) {final _that = this;
switch (_that) {
case _MainPageModel() when $default != null:
return $default(_that.searchController,_that.searchFocus,_that.myTexts);case _:
  return null;

}
}

}

/// @nodoc


class _MainPageModel implements MainPageModel {
  const _MainPageModel({required this.searchController, required this.searchFocus, final  List<TextsModel> myTexts = const []}): _myTexts = myTexts;
  

@override final  TextEditingController searchController;
@override final  FocusNode searchFocus;
 final  List<TextsModel> _myTexts;
@override@JsonKey() List<TextsModel> get myTexts {
  if (_myTexts is EqualUnmodifiableListView) return _myTexts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_myTexts);
}


/// Create a copy of MainPageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainPageModelCopyWith<_MainPageModel> get copyWith => __$MainPageModelCopyWithImpl<_MainPageModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainPageModel&&(identical(other.searchController, searchController) || other.searchController == searchController)&&(identical(other.searchFocus, searchFocus) || other.searchFocus == searchFocus)&&const DeepCollectionEquality().equals(other._myTexts, _myTexts));
}


@override
int get hashCode => Object.hash(runtimeType,searchController,searchFocus,const DeepCollectionEquality().hash(_myTexts));

@override
String toString() {
  return 'MainPageModel(searchController: $searchController, searchFocus: $searchFocus, myTexts: $myTexts)';
}


}

/// @nodoc
abstract mixin class _$MainPageModelCopyWith<$Res> implements $MainPageModelCopyWith<$Res> {
  factory _$MainPageModelCopyWith(_MainPageModel value, $Res Function(_MainPageModel) _then) = __$MainPageModelCopyWithImpl;
@override @useResult
$Res call({
 TextEditingController searchController, FocusNode searchFocus, List<TextsModel> myTexts
});




}
/// @nodoc
class __$MainPageModelCopyWithImpl<$Res>
    implements _$MainPageModelCopyWith<$Res> {
  __$MainPageModelCopyWithImpl(this._self, this._then);

  final _MainPageModel _self;
  final $Res Function(_MainPageModel) _then;

/// Create a copy of MainPageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchController = null,Object? searchFocus = null,Object? myTexts = null,}) {
  return _then(_MainPageModel(
searchController: null == searchController ? _self.searchController : searchController // ignore: cast_nullable_to_non_nullable
as TextEditingController,searchFocus: null == searchFocus ? _self.searchFocus : searchFocus // ignore: cast_nullable_to_non_nullable
as FocusNode,myTexts: null == myTexts ? _self._myTexts : myTexts // ignore: cast_nullable_to_non_nullable
as List<TextsModel>,
  ));
}


}

// dart format on
