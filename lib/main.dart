// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uts_flutter_remake/model/productModel.dart';
import 'package:uts_flutter_remake/screen/DetailScreen.dart';
import 'package:uts_flutter_remake/screen/LoginNew/LoginScreen.dart';
import 'package:uts_flutter_remake/screen/MainScreen.dart';
import 'package:uts_flutter_remake/screen/SearchPage.dart';
import 'package:uts_flutter_remake/screen/SplashScreen.dart';
import 'package:uts_flutter_remake/screen/TQScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'UbuntuMono'),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/Login": (context) => LoginScreen(),
        "/MainScreen": (context) => MainScreen(),
        "/DetailScreen": (context) => DetailScreen(
            data: ModalRoute.of(context)?.settings.arguments as Products),
        "/TQ": (context) => TQ(),
        "/searchPage": (context) => SearchPage(
            keyword: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
