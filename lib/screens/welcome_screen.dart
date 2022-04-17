import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ioe_health/screens/login_screen.dart';

import '../constants.dart';

class welcome_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _welcome_screen_state();
  }
}

class _welcome_screen_state extends State<welcome_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ktext_color,
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Container(
                child: Image(
                  image: AssetImage('images/health_logo.png'),
                  height: 250,
                ),
              ),
              Center(
                child: Container(
                  child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          TypewriterAnimatedText('Welcome to Health Analyzer'),
                        ],
                      )),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: const Text(
                    'Get and Keep track of all your Health related data here, at one place.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'Agne',
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(30),
                child: TextButton(
                    child: const Text("Get Started",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login_screen()),
                      );
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(25)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kbackground_color),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: kbackground_color))))),
              )
            ])));
  }
}