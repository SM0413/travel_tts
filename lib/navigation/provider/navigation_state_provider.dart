import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_tts/navigation/model/navigation_model.dart';

class NavigationStateProvider extends Notifier<NavigationModel> {
  @override
  NavigationModel build() {
    return const NavigationModel();
  }

  void setState({int? selectedIndex}) {
    state = state.copyWith(selectedIndex: selectedIndex ?? state.selectedIndex);
  }

  void empty() {
    state = const NavigationModel();
  }
}

final navigationStateProvider =
    NotifierProvider<NavigationStateProvider, NavigationModel>(
      NavigationStateProvider.new,
    );
