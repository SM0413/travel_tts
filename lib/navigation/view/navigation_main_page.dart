import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/enums/navigation_enum.dart';
import 'package:travel_tts/navigation/provider/navigation_state_provider.dart';

class NavigationMainPage extends HookConsumerWidget {
  const NavigationMainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(navigationStateProvider);
    final notifier = ref.read(navigationStateProvider.notifier);
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: state.selectedIndex,
            children: NavigationEnum.values.map((value) => value.page).toList(),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (value) {
            notifier.setState(selectedIndex: value);
          },
          items: NavigationEnum.values
              .map(
                (value) => BottomNavigationBarItem(
                  icon: value.icon.outline,
                  activeIcon: value.icon.rounded,
                  label: value.ko,
                  tooltip: value.ko,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
