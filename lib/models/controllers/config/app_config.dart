import 'package:embedded_config_annotations/embedded_config_annotations.dart';

// Add the generated file as a part
part 'app_config.embedded.dart';

@EmbeddedConfig('app_config')
abstract class AppConfig {
  static const AppConfig instance = _$AppConfigEmbedded();

  String get applicationId;
  AppAuthConfig get auth0;

  const AppConfig();
}

@EmbeddedConfig('app_config', path: ['auth0'])
abstract class AppAuthConfig {
  String get domain;
  String get clientId;
  String get redirectUri;
  String get redirectUriAndroid;

  const AppAuthConfig();
}
