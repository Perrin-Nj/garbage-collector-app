// ignore: file_names
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
      body: Column(
        children: const [Text('ICI LA PAGE POUR LE COMPTE')],
      ),
    );
  }
}
