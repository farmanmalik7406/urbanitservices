import 'package:flutter/material.dart';
import 'package:urbanitservices/pages/login.dart';
import 'package:urbanitservices/utils/utils.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const Login(),
        MyRoutes.loginRoute: (context) => const Login(),
        MyRoutes.homeRoute: (context) => const HomePage()
      },
    );
  }
}
