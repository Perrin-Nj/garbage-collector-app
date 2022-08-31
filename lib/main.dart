import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbage_collector_app/splash_screen.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    // MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garbage Collector app',
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
