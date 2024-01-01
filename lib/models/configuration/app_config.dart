import 'package:embedded_config_annotations/embedded_config_annotations.dart';

// Add the generated file as a part
part 'app_config.embedded.dart';

@EmbeddedConfig('app_config')
abstract class AppConfig {
  static const AppConfig instance = _$AppConfigEmbedded();

  String get auth0Domain;
  String get auth0ClientId;
  String get auth0RedirectUri;
  String get auth0RedirectUriAndroid;

  const AppConfig();
}
