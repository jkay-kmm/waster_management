import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waste_managament/ui/home/home_screen.dart';
import 'package:waste_managament/ui/login/login.dart';
import 'package:waste_managament/ui/register/register.dart';
import 'package:waste_managament/ui/splash/splash_screen.dart';
import 'package:waste_managament/ui/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}

