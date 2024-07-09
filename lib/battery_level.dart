import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLabel extends StatefulWidget {
  const BatteryLabel({super.key});

  @override
  State<BatteryLabel> createState() => _BatteryLabelState();
}

class _BatteryLabelState extends State<BatteryLabel> {
  static const platform =
      MethodChannel('com.example.method_channel_example/battery');
  String _batteryLabel = "Not fetching battery currently";

  Future<void> getBatteryPercentage() async {
    String batteryPercentage;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryPercentage = 'Battery percentage is $result';
    } catch (e) {
      return print('error during fetch battery percentage ');
    }

    setState(() {
      _batteryLabel = batteryPercentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_batteryLabel),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getBatteryPercentage,
              child: Text('Get Battery Level'),
            ),
          ],
        ),
      )),
    );
  }
}
