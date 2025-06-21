import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iron_log/root.dart';

void main() {
  const app = MaterialApp(home: Root(),);

  const scope = ProviderScope(child: app);
  runApp(scope);
}
