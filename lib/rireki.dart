import 'package:flutter/material.dart';

class Rireki extends StatelessWidget {
  const Rireki({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('履歴'),
    );
    return Scaffold(
      appBar: appBar,
    );
  }
}
