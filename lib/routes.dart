import 'package:flutter/cupertino.dart';
import 'package:vaicorinthians/pages/login_page.dart';
import 'package:vaicorinthians/pages/recover_page.dart';
import 'package:vaicorinthians/pages/signup_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
    RecoverPage.route: (context) => RecoverPage(),
  };
}
