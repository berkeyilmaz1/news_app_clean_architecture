import 'package:envied/envied.dart';

part 'env.g.dart';

abstract class AppConfiguration {
  String get apiKey;
}

@Envied(obfuscate: true, path: 'assets/env/.env')
final class Env implements AppConfiguration {
  @EnviedField(varName: 'apiKey')
  static final String _apiKey = _Env._apiKey;

  @override
  String get apiKey => _apiKey;
}
