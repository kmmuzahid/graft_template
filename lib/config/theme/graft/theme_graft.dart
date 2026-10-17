import 'package:graft/graft.dart';
import 'package:material_ui/material_ui.dart';

class ThemeState extends GraftState {
  ThemeMode mode;

  ThemeState({this.mode = ThemeMode.dark});

  @override
  GraftProps get props => propsOf(mode);
}

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
