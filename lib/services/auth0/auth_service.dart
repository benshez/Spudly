import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spudly/models/config/app_config.dart';
//import 'package:mjcoffee/models/auth0_id_token.dart';
import 'package:spudly/models/auth0/auth0_user.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();

  factory AuthService() {
    return instance;
  }

  AuthService._internal();

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  bool _isBusy = false;

  Future<void> login({bool preferEphemeralSession = false}) async {
    try {
      _setBusyState();
    } catch (_) {
      _clearBusyState();
    }
  }

  void _clearBusyState() {
    _isBusy = false;
  }

  void _setBusyState() {
    _isBusy = true;
  }
}
