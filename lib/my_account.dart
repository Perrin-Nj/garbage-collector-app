// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Myaccount extends StatelessWidget {
  const Myaccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Page pour votre compte',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ElevatedButton.icon(
        //button to log out
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        icon: const Icon(Icons.arrow_back),
        onPressed: () => FirebaseAuth.instance.signOut(),
        label: const Text(
          'Se déconnecter',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
