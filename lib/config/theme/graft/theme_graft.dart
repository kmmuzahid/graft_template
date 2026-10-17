
import 'package:graft/graft.dart';
import 'package:material_ui/material_ui.dart';
import 'theme_state.dart';

export 'theme_state.dart';

class ThemeGraft extends Graft<ThemeState> {
  ThemeGraft() : super(ThemeState());

  void toggleTheme() {
    state
      ..mode = state.mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark
      ..update();
  }

  void setThemeMode(ThemeMode mode) {
    state
      ..mode = mode
      ..update();
  }
}
