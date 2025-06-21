import 'package:flutter/material.dart';

class ShumokuTsuika extends StatelessWidget {
  const ShumokuTsuika({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('種目追加'),
    );
    return Scaffold(
      appBar: appBar,
    );
  }
}
