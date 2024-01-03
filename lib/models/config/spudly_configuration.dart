import 'package:embedded_config_annotations/embedded_config_annotations.dart';

part 'spudly_configuration.embedded.dart';

@EmbeddedConfig('app_config', path: ['spudly'])
abstract class SpudlyConfiguration {
  static const SpudlyConfiguration instance = _$SpudlyConfigurationEmbedded();
  String get applicationId;
  SpudlyAuthentication get authentication;

  const SpudlyConfiguration();
}

@EmbeddedConfig('app_config', path: ['spudly', 'authentication'])
abstract class SpudlyAuthentication {
  SpudlyApplicationConfiguration get application;
  SpudlyApiConfiguration get api;

  const SpudlyAuthentication();
}

@EmbeddedConfig('app_config', path: ['spudly', 'authentication', 'application'])
abstract class SpudlyApplicationConfiguration {
  String get domain;
  String get clientId;
  String get redirectUri;
  String get redirectUriAndroid;

  const SpudlyApplicationConfiguration();
}

@EmbeddedConfig('app_config', path: ['spudly', 'authentication', 'api'])
abstract class SpudlyApiConfiguration {
  String get clientId;
  String get clientSecret;
  String get grantType;
  String get authority;
  String get audience;

  const SpudlyApiConfiguration();
}
