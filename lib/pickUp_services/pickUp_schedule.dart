// ignore: file_names
import 'package:flutter/material.dart';

class PickUpSchedule extends StatelessWidget {
  const PickUpSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Programmer Un rammassage',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: const [Text('ICI LA PAGE POUR PROGRAMMER UN RAMASSAGE!!')],
      ),
    );
  }
}
