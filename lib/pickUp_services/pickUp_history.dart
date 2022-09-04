// ignore: file_names
import 'package:flutter/material.dart';

class PickUpHistory extends StatelessWidget {
  const PickUpHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mon historique',
        ),
      ),
      body: Column(
        children: const [
          Text(
            'ICI LA PAGE POUR VOIR VOTRE HISTORIQUE DE RAMASSAGE;',
          )
        ],
      ),
    );
  }
}
