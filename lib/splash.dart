import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotel_finder/Auth_Screen/user_Auth/login_user.dart';
import 'package:hotel_finder/Auth_Screen/welcome_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WelcomeScreen();
      }));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.white]),
          image: DecorationImage(image: AssetImage("assets/images/2.png"))),
    ));
  }
}
