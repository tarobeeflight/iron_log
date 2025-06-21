import 'package:flutter/material.dart';

class Settei extends StatelessWidget {
  const Settei({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('設定'),
    );
    return Scaffold(
      appBar: appBar,
    );
  }
}
