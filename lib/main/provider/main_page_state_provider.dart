import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/main/model/main_page_model.dart';

class MainPageStateProvider extends Notifier<MainPageModel> {
  @override
  MainPageModel build() {
    return MainPageModel(
      searchController: TextEditingController(),
      searchFocus: FocusNode(),
    );
  }

  void setState({List<TextsModel>? texts}) {
    state = state.copyWith(texts: texts ?? state.texts);
  }

  void empty() {
    state = MainPageModel(
      searchController: TextEditingController(),
      searchFocus: FocusNode(),
    );
  }
}

final mainPageStateProvider =
    NotifierProvider<MainPageStateProvider, MainPageModel>(
      MainPageStateProvider.new,
    );
