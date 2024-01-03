class AuthorizationService {
  static final AuthorizationService instance = AuthorizationService._internal();

  factory AuthorizationService() {
    return instance;
  }

  AuthorizationService._internal();
}
