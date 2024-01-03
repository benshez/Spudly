import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:spudly/models/config/spudly_configuration.dart';

class AuthenticationService {
  static final AuthenticationService instance =
      AuthenticationService._internal();

  factory AuthenticationService() {
    return instance;
  }

  AuthenticationService._internal();

  Auth0? auth0;
  Auth0Web? auth0Web;
  Credentials? fetchedCredentials;

  Future<Credentials> login() async {
    try {
      auth0Web = Auth0Web(
          SpudlyConfiguration.instance.authentication.application.domain,
          SpudlyConfiguration.instance.authentication.application.clientId);

      await auth0Web!.onLoad().then((final credentials) async {
        if (credentials != null) {
          //await setRefreshToken(credentials.user.sub);
          fetchedCredentials = credentials;
          return credentials;
        } else {
          return null;
        }
      });

      return fetchedCredentials as Credentials;
    } catch (e, s) {
      throw Exception('Failed to get user credentials');
    }
  }
}
