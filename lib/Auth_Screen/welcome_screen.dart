import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_finder/Auth_Screen/hotel_auth/login_hotel.dart';
import 'package:hotel_finder/Auth_Screen/hotel_auth/regester_hotel.dart';
import 'package:hotel_finder/Auth_Screen/user_Auth/login_user.dart';
import 'package:hotel_finder/Auth_Screen/user_Auth/register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 253, 253),
            Color.fromARGB(255, 255, 253, 253),
          ])),
          child: Column(children: [
            Container(
              child: SvgPicture.asset("assets/images/2.svg"),
              height: MediaQuery.of(context).size.height / 3.75,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Container(
                  height: 300,
                  child: Image(image: AssetImage('assets/images/2.png'))),
            ),
            Column(
              children: [
                Text(
                  'Welcome ',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text(
                  'chocse your type ',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Container(
                    height: 53,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        'User',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Reg_hotel()));
                  },
                  child: Container(
                    height: 53,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Center(
                      child: Text(
                        'Hotel Manger  ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
