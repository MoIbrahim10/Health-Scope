import 'package:flutter/material.dart';
import 'package:healthscope/routes.dart';
import 'package:healthscope/screens/splash/splash_screen.dart';
import 'package:healthscope/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Scope',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
