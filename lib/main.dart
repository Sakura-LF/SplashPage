import 'package:flutter/material.dart';
import 'package:splashpage/pages/login.dart';
import 'package:splashpage/pages/splash.dart';
import 'package:splashpage/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const SplashPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // 设置全局字体
        fontFamily: "LXGW"
      ),
    );
  }
}

