import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbage_collector_app/auth/splash_screen.dart';
import 'package:garbage_collector_app/utils/Themes.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    // MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garbage Collector app',
      home: const SplashScreen(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      theme: lightTheme(),
    );
  }
}
//Stopped at 12:00 mins