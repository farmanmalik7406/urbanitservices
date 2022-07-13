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
      initialRoute: MyRoutes.homeRoute,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
            iconTheme: IconThemeData(color: Colors.deepPurple)),
        drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.deepPurple, scrimColor: Colors.deepPurple),
      ),
      routes: {
        "/": (context) => const Login(),
        MyRoutes.loginRoute: (context) => const Login(),
        MyRoutes.homeRoute: (context) => const HomePage()
      },
    );
  }
}
