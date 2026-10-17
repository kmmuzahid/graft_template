import 'package:flutter/foundation.dart';
import 'package:graft_template/config/dependency/dependency_injection.dart';
import 'package:graft_template/my_app.dart';
import 'package:material_ui/material_ui.dart';

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
  _diInit();
}

void _diInit() {
  final dI = DependencyInjection();
  dI.dependencies();
}
