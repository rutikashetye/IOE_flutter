import 'package:flutter/material.dart';

import '../constants.dart';
import 'login_screen.dart';

class signup_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _signup_screen_state();
  }
}

class _signup_screen_state extends State<signup_screen> {
  bool _isObscure = true;
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
                  'Create new Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: const Text(
                    'Please fill in the form to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff367dab),
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextField(
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
                    margin: EdgeInsets.only(
                      bottom: 15,
                      left: 15,
                      right: 15,
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.alternate_email),
                            fillColor: kinput_foreground_color,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: kinput_text_color),
                            hintText: 'Enter Your Email',
                            hintStyle: TextStyle(color: Colors.white)))),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.local_phone),
                            fillColor: kinput_foreground_color,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: kinput_text_color),
                            hintText: 'Enter Your Number',
                            hintStyle: TextStyle(color: Colors.white)))),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        obscureText: _isObscure,
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
                      child: const Text("Sign Up",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signup_screen()),
                        );
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
                    const Text('Have an Account? ',
                        style: TextStyle(color: Colors.white)),
                    GestureDetector(
                      child: const Text("Sign In",
                          style: TextStyle(color: Colors.blue)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login_screen()),
                        );
                      },
                    )
                  ],
                ),
              ]),
        ));
  }
}