import 'package:flutter/material.dart';
import 'package:sensia/pages/OnboardingScreen.dart';
import 'package:sensia/pages/authentication/Login.dart';
import 'package:sensia/pages/authentication/signup.dart';
import 'package:sensia/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
