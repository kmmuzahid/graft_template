import 'package:graft/graft.dart';
import 'package:graft_template/config/theme/graft/theme_graft.dart';
import 'package:material_ui/material_ui.dart';

class ToggleTheme extends StatelessWidget {
  const ToggleTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final themeGraft = context.use(ThemeGraft.new);

    return themeGraft.slot(
      builder: (s) => SegmentedButton<String>(
        segments: const <ButtonSegment<String>>[
          ButtonSegment<String>(value: 'Light', label: Text('Light')),
          ButtonSegment<String>(value: 'Dark', label: Text('Dark')),
        ],
        selected: <String>{s.mode == ThemeMode.dark ? 'Dark' : 'Light'},
        onSelectionChanged: (_) {
          themeGraft.toggleTheme();
        },
      ),
    );
  }
}
