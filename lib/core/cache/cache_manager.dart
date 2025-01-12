import 'package:hive_flutter/hive_flutter.dart';

final class CacheManager<T> {
  CacheManager({required this.boxName, this.adapter});

  Box<T>? _box;
  final String boxName;
  final TypeAdapter<T>? adapter;

  Future<void> initialize() async {
    if (adapter != null) {
      registerAdapter(adapter!);
    }
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<T>(boxName);
    }
  }

  /// Get the value of the key from the box
  T? get(String key) {
    return _box?.get(key);
  }

  /// Put the value of the key to the box
  Future<void> put({required String key, required T value}) async {
    await _box?.put(key, value);
  }

  void registerAdapter(TypeAdapter<T> adapter) {
    Hive.registerAdapter<T>(adapter);
  }
}
