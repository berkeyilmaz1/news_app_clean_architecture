import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/config/env/app_environment.dart';
import 'package:news_app/config/env/env.dart';
import 'package:news_app/injector.dart';

final class ApplicationStart {
  ApplicationStart._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
    await setupDependencies();

    AppEnvironment.setup(Env());
  }
}
