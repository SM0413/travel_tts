import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/my/model/my_texts_list_main_page_model.dart';

class MyTextsListMainPageStateProvider
    extends AutoDisposeNotifier<MyTextsListMainPageModel> {
  @override
  MyTextsListMainPageModel build() {
    return const MyTextsListMainPageModel();
  }

  void setState({
    List<TextsModel>? deleteModelList,
    bool? isDelete,
    bool? isCheckAll,
  }) {
    state = state.copyWith(
      deleteModelList: deleteModelList ?? state.deleteModelList,
      isDelete: isDelete ?? state.isDelete,
      isCheckAll: isCheckAll ?? state.isCheckAll,
    );
  }

  void setDeleteModelList({required TextsModel model}) {
    final copy = List<TextsModel>.from(state.deleteModelList);
    bool isCheckAll = state.isCheckAll;
    if (copy.contains(model)) {
      copy.remove(model);
      isCheckAll = false;
    } else {
      copy.add(model);
    }
    if (copy.length == ref.read(localDbStateProvider).value?.texts.length) {
      isCheckAll = true;
    }
    setState(deleteModelList: copy, isCheckAll: isCheckAll);
  }
}

final myTextsListMainPageStateProvider =
    AutoDisposeNotifierProvider<
      MyTextsListMainPageStateProvider,
      MyTextsListMainPageModel
    >(MyTextsListMainPageStateProvider.new);
