import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

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
    auth0 = Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    var credentials = await auth0!
        .webAuthentication(scheme: 'com.example.spudly')
        .login(redirectUrl: dotenv.env['AUTH0_REDIRECT_URI_ANDROID']!);
    //await setRefreshToken(credentials);
    fetchedCredentials = credentials;
  }

  Future<void> doWebInit() async {
    auth0Web =
        Auth0Web(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);

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
    auth0Web =
        Auth0Web(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);

    await auth0Web!.loginWithPopup();
    // await auth0Web!
    //     .loginWithRedirect(redirectUrl: dotenv.env['AUTH0_REDIRECT_URI']);

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
