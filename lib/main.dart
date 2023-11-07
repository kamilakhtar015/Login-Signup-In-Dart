import 'package:flutter/material.dart';
import 'package:login_signup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    // theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFA9A9A9)),
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login': (context) => const MySignUp()},
  ));
}
