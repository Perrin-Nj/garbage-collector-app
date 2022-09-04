// ignore: file_names
import 'package:flutter/material.dart';

class PickUpSubscription extends StatelessWidget {
  const PickUpSubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Souscrire à Un rammassage',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: const [
          Text('ICI LA PAGE POUR SOUSCRIRE A UN SERVICE DE RAMASSAGE')
        ],
      ),
    );
  }
}
