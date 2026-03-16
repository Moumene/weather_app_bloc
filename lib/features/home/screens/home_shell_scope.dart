import 'package:flutter/material.dart';

class HomeShellScope extends InheritedWidget {
  const HomeShellScope({
    super.key,
    required this.onSwitchToSettings,
    required this.onSwitchToTab,
    required super.child,
  });

  final VoidCallback onSwitchToSettings;
  final void Function(int index) onSwitchToTab;

  static HomeShellScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeShellScope>();
  }

  @override
  bool updateShouldNotify(HomeShellScope oldWidget) {
    return onSwitchToSettings != oldWidget.onSwitchToSettings ||
        onSwitchToTab != oldWidget.onSwitchToTab;
  }
}
