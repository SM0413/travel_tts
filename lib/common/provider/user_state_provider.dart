import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/users_model.dart';

class UserStateProvider extends Notifier<UsersModel> {
  @override
  UsersModel build() {
    return const UsersModel();
  }

  void setModel(UsersModel? model) {
    if (model == null) {
      empty();
    } else {
      state = model;
    }
  }

  void empty() {
    state = const UsersModel();
  }
}

final userStateProvider = NotifierProvider<UserStateProvider, UsersModel>(
  UserStateProvider.new,
);
