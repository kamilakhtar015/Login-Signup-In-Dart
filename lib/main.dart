import 'package:flutter/material.dart';
// import 'package:login_signup/signin.dart';
import 'package:login_signup/signup.dart';

void main() {
  runApp(MaterialApp(
    // theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFA9A9A9)),
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login': (context) => const MySignUp()},
  ));
}
