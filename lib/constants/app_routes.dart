import 'package:get/get.dart';
import 'package:spudly/ui/widgets/widgets.dart';
import 'package:spudly/ui/auth/auth.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => SplashWidget()),
    GetPage(name: '/signin', page: () => SignInUI()),
    GetPage(name: '/signup', page: () => SignUpUI()),
    GetPage(name: '/home', page: () => HomeWidget()),
    GetPage(name: '/settings', page: () => SettingsWidget()),
    GetPage(name: '/reset-password', page: () => ResetPasswordUI()),
    GetPage(name: '/update-profile', page: () => UpdateProfileUI()),
    GetPage(name: '/todos', page: () => TodosWidget()),
  ];
}
