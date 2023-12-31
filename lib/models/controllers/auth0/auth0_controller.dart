import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import '/models/controllers/auth0/auth0_state.dart';
import '/models/repositories/auth0/auth0_repository.dart';

final auth0NotifierProvider =
    StateNotifierProvider<Auth0Controller, Auth0State>(
  (ref) => Auth0Controller(),
);

class Auth0Controller extends StateNotifier<Auth0State> {
  Auth0Controller() : super(const Auth0State());

  final repository = Auth0Repository();

  Future<void> initAction() async {
    state = state.copyWith(isBusy: true);
    try {
      final storedRefreshToken =
          await repository.getRefreshToken('refresh_token');

      //Check stored refresh token
      if (storedRefreshToken == '') {
        state = state.copyWith(isBusy: false);
        await repository.doAppInit();
        if (storedRefreshToken == '') return;
      }

      // Call init action repository
      final data = await repository.initAction();
      state = state.copyWith(isBusy: false, isLoggedIn: true, data: data);
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      logout();
    }
  }

  Future<void> login() async {
    state = state.copyWith(isBusy: true);
    try {
      final data = await repository.login();
      state = state.copyWith(isBusy: false, isLoggedIn: true, data: data);
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      state = state.copyWith(
          isBusy: false, isLoggedIn: false, errorMessage: e.toString());
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isBusy: true);
    await const FlutterSecureStorage().delete(key: 'refresh_token');
    state = state.copyWith(isBusy: false, isLoggedIn: false);
  }
}
