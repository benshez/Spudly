import 'package:spudly/models/config/spudly_configuration.dart';

class AppConfig {
  static final AppConfig instance = AppConfig._internal();
  late SpudlyConfiguration spudly = SpudlyConfiguration.instance;

  SpudlyConfiguration spudlyConfig() {
    return spudly;
  }

  factory AppConfig() {
    return instance;
  }

  AppConfig._internal();
}
