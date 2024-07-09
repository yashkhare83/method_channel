import 'package:flutter/material.dart';
import 'package:method_channel/battery_level.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BatteryLabel());
  }
}
