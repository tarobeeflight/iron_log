import 'package:flutter/material.dart';

class SetIchiran extends StatelessWidget {
  const SetIchiran({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('セット一覧'),
    );
    return Scaffold(
      appBar: appBar,
    );
  }
}
