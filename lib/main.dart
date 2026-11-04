import 'package:flutter/foundation.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/dependency/dependency_injection.dart';
import 'package:graft_template/config/storage/shared_prefs_dry_config.dart';
import 'package:graft_template/my_app.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  if (kDebugMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      debugPrint('Flutter error: ${details.exception}');
      return const Center(child: Text('Oops, something went wrong'));
    };
  }

  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const MyApp());
}

Future<void> init() async {
  // Pre-load SharedPreferences and configure Graft with Frame-0 dry persistence and DI
  final prefs = await SharedPreferences.getInstance();
  Graft.config(
    dryConfig: SharedPrefsDryConfig(prefs),
    di: configureDependencies,
  );
}
