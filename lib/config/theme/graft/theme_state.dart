import 'package:graft/graft.dart';
import 'package:material_ui/material_ui.dart';

class ThemeState extends GraftState {
  ThemeMode mode;

  ThemeState({this.mode = ThemeMode.dark});

  @override
  GraftProps get props => propsOf(mode);
}
