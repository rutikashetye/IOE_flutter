import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ioe_health/screens/dashboard_screen.dart';

import '../constants.dart';
import 'dashboard_screen.dart';
import 'sign_up_screen.dart';

class login_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _login_screen_state();
  }
}

class _login_screen_state extends State<login_screen> {
  bool _isObscure = true;
  String username = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kbackground_color,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextField(
                        onChanged: (value) {
                          username = value;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            fillColor: kinput_foreground_color,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'User Name',
                            labelStyle: TextStyle(color: kinput_text_color),
                            hintText: 'Enter Your Name',
                            hintStyle: TextStyle(color: Colors.white)))),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        obscureText: _isObscure,
                        onChanged: (value) {
                          pass = value;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.vpn_key),
                            fillColor: kinput_foreground_color,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Password',
                            hintText: 'Enter Password',
                            labelStyle: TextStyle(color: kinput_text_color),
                            hintStyle: TextStyle(color: Colors.white)))),
                Container(
                  margin: EdgeInsets.all(30),
                  child: TextButton(
                      child: const Text("Login",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        if (username == "admin" && pass == "1234") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => dashboard_screen()),
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Enter correct username and password",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: kinput_text_color,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(25)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue))))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('New User? ',
                        style: TextStyle(color: Colors.white)),
                    GestureDetector(
                      child: const Text("Sign Up",
                          style: TextStyle(color: Colors.blue)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signup_screen()),
                        );
                      },
                    )
                  ],
                ),
              ]),
        ));
  }
}