import 'package:flutter/material.dart';

class ShumokuIchiran extends StatelessWidget {
  const ShumokuIchiran({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('種目一覧'),
    );
    return Scaffold(
      appBar: appBar,
    );
  }
}
