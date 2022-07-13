// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:urbanitservices/utils/utils.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
          child: Column(
        children: [
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
            height: 400,
          ),
          Text("Welcome", style: TextStyle(fontSize: 30)),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter Username", label: Text("Username")),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password", label: Text("Password")),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            child: Text("Login"),
          )
        ],
      )),
    );
  }
}
