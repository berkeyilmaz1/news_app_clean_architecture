import 'package:news_app/config/env/env.dart';

final class AppEnvironment {
  AppEnvironment.setup(AppConfiguration config) {
    _config = config;
  }
  static late final AppConfiguration _config;

  static String get apiKey => _config.apiKey;
}

enum AppEnvironmentItems {
  apiKey;

  String get value {
    switch (this) {
      case AppEnvironmentItems.apiKey:
        return AppEnvironment.apiKey;
    }
  }
}
