import 'package:flutter/material.dart';
import 'package:news_app/injector.dart';

final class ApplicationStart {
  ApplicationStart._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupDependencies();
  }
}
