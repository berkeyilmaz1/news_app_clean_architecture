import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/injector.dart';

final class ApplicationStart {
  ApplicationStart._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupDependencies();

    await Hive.initFlutter();
  }
}
