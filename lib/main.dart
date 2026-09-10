import 'package:flutter/material.dart';
import 'package:vaicorinthians/pages/login_page.dart';
import 'package:vaicorinthians/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      title: 'Flutter Demo',
      initialRoute: LoginPage.route,
    );
  }
}
