import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'dashboard_screen.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class steps_widget extends StatefulWidget {
  const steps_widget();
  @override
  State<StatefulWidget> createState() {
    return _steps_widget_state();
  }
}

class _steps_widget_state extends State<steps_widget> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = 0;
  double previousDistacne = 0.0;
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kinput_foreground_color,
        body: StreamBuilder<AccelerometerEvent>(
            stream: SensorsPlatform.instance.accelerometerEvents,
            builder: (context, snapShort) {
              if (snapShort.hasData) {
                x = snapShort.data!.x;
                y = snapShort.data!.y;
                z = snapShort.data!.z;
                distance = getValue(x, y, z);
                if (distance > 6) {
                  steps++;
                }
                calories = calculateCalories(steps);
                duration = calculateDuration(steps);
                miles = calculateMiles(steps);
              }
              return Stack(children: [
                Expanded(
                  child: Reusable_card(
                    title: "Steps",
                    next_page_title: "Steps Live Data",
                    link_for_webview: "images/steps_live.png",
                    data: steps.toString(),
                    fontsize: 25,
                    img: AssetImage("images/heart_pulse.png"),
                    width: 50,
                  ),
                )
              ]);
            }));
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistacne;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistacne = _pref.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }
}