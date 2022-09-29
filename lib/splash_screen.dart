import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collector_app/auth/login/choose_user_type.dart';

import 'homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //if the user is signIn for the 1st time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Home();
            } else {
              return const SplashState();
            }
          }),
    );
  }
}

class SplashState extends StatefulWidget {
  const SplashState({Key? key}) : super(key: key);

  @override
  State<SplashState> createState() => _SplashStateState();
}

class _SplashStateState extends State<SplashState> {
  late Timer timer;
  @override
  void initState() {
    super.initState();

    timer = Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ChooseUserType()),
          (Route<dynamic> route) => false),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromRGBO(51, 182, 161, 1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 300.0,
                width: 300.0,
              ),
              const Text(
                'Nous collectons les ordures, \nEt déchets chez vous, pour vous.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
