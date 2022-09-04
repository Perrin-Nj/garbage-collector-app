// ignore: file_names
import 'package:flutter/material.dart';

class OurAgencies extends StatelessWidget {
  const OurAgencies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Our agencies page',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: const [
          Text(
            'ICI LA PAGE POUR VOIR NOS AGENCES PRES DE VOUS;',
          )
        ],
      ),
    );
  }
}
