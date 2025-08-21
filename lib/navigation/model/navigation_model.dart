import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_model.freezed.dart';

@freezed
abstract class NavigationModel with _$NavigationModel {
  const factory NavigationModel({@Default(0) int selectedIndex}) =
      _NavigationModel; // 올바른 생성자 이름
}
