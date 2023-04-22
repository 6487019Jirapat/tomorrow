import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_raining.dart';
import 'package:weather_app/screens/home_sunny.dart';
import 'package:weather_app/screens/home_winter.dart';
import 'package:weather_app/screens/items/home_raining_items.dart';
import 'package:weather_app/screens/items/home_sunny_items.dart';
import 'package:weather_app/screens/items/home_winter_items.dart';
import 'package:weather_app/ui/forecast.dart';
import 'package:weather_app/ui/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather_app/ui/register_login.dart';

Future<void> main() async{
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tomorrow',
      home: Register_Login(), 
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
