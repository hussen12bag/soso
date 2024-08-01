import 'package:flutter/material.dart';
import 'package:hotel_finder/homepage.dart';
import 'package:hotel_finder/Auth_Screen/splash.dart';
import 'package:hotel_finder/user/profile.dart';
import 'package:hotel_finder/user/userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
