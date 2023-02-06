import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/pages/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tAppName,
      theme: ThemeData(
        primarySwatch: tColorsPrimary,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}

