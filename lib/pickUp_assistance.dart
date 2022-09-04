// ignore: file_names
import 'package:flutter/material.dart';

class PickUpAssistance extends StatelessWidget {
  const PickUpAssistance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Page pour assitance',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: const [Text('ICI LA PAGE POUR Une assistance')],
      ),
    );
  }
}
