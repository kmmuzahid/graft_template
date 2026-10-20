import 'dart:convert';
import 'dart:typed_data';
import 'package:graft/graft.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Production-ready SharedPreferences storage driver for Graft Frame-0 persistence.
class SharedPrefsStateConfig implements GraftStateConfig {
  final SharedPreferences prefs;
  SharedPrefsStateConfig(this.prefs);

  static const String _prefix = 'graft_';

  @override
  Map<String, Uint8List> readAllSync() {
    final results = <String, Uint8List>{};
    for (final key in prefs.getKeys()) {
      if (key.startsWith(_prefix)) {
        final val = prefs.getString(key);
        if (val != null) {
          try {
            results[key.substring(_prefix.length)] = base64Decode(val);
          } catch (_) {
            // Ignore malformed entries
          }
        }
      }
    }
    return results;
  }

  @override
  Future<Uint8List?> read(String key) async {
    final val = prefs.getString('$_prefix$key');
    if (val == null) return null;
    try {
      return base64Decode(val);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> write(String key, Uint8List value) async {
    await prefs.setString('$_prefix$key', base64Encode(value));
  }

  @override
  Future<void> delete(String key) async {
    await prefs.remove('$_prefix$key');
  }

  @override
  Future<void> close() async {
    // SharedPreferences maintains no open file handle requiring disposal
  }
}
