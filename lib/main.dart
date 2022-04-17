import 'package:flutter/material.dart';
import 'package:ioe_health/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: dashboard_screen(),
        home: welcome_screen(),
        debugShowCheckedModeBanner: false);
  }
}