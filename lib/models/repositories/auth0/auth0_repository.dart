import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:spudly/models/configuration/app_config.dart';

class Auth0Repository {
  Auth0? auth0;
  Auth0Web? auth0Web;
  Credentials? fetchedCredentials;

  Future<Credentials> initAction() async {
    if (kIsWeb) {
      await doWebInit();
    } else {
      await doAppInit();
    }

    return fetchedCredentials as Credentials;
  }

  Future<Credentials> login() async {
    if (kIsWeb) {
      await doWebInit();
      await loginWeb();
    } else {
      await doAppInit();
    }

    return fetchedCredentials as Credentials;
  }

  Future<void> doAppInit() async {
    auth0 =
        Auth0(AppConfig.instance.auth0Domain, AppConfig.instance.auth0ClientId);
    var credentials = await auth0!
        .webAuthentication(scheme: 'com.example.spudly')
        .login(redirectUrl: AppConfig.instance.auth0RedirectUriAndroid);
    await setRefreshToken(credentials);
    fetchedCredentials = credentials;
  }

  Future<void> doWebInit() async {
    auth0Web = Auth0Web(
        AppConfig.instance.auth0Domain, AppConfig.instance.auth0ClientId);

    await auth0Web!.onLoad().then((final credentials) async {
      if (credentials != null) {
        await setRefreshToken(credentials.user.sub);
        fetchedCredentials = credentials;
        //Navigator.of(context).pushNamed('profile_view');
        return credentials;
      } else {
        return null;
      }
    });
  }

  Future<Credentials> loginWeb() async {
    auth0Web = Auth0Web(
        AppConfig.instance.auth0Domain, AppConfig.instance.auth0ClientId);

    await auth0Web!.loginWithPopup();
    // await auth0Web!
    //     .loginWithRedirect(redirectUrl: AppConfig.instance.auth0RedirectUri);

    fetchedCredentials = await auth0Web!.credentials();
    return fetchedCredentials as Credentials;
  }

  Future<void> setRefreshToken(key) async {
    await const FlutterSecureStorage().write(key: 'refresh_token', value: key);
  }

  Future<String> getRefreshToken(key) async {
    var token = await const FlutterSecureStorage().read(key: key);
    token ??= '';
    return token.toString();
  }
}
