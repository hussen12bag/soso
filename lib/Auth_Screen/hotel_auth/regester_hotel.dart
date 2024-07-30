import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_finder/Auth_Screen/hotel_auth/login_hotel.dart';
import 'package:hotel_finder/Auth_Screen/user_Auth/login_user.dart';
import 'package:hotel_finder/DB/links.dart';
import 'package:hotel_finder/Map/map.dart';
import 'package:hotel_finder/components/Text_form.dart';
import 'package:hotel_finder/components/rectangular_button.dart';
import 'package:hotel_finder/main.dart';
import 'package:hotel_finder/theme/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class Reg_hotel extends StatefulWidget {
  const Reg_hotel({super.key});

  @override
  State<Reg_hotel> createState() => _Reg_hotelState();
}

class _Reg_hotelState extends State<Reg_hotel> {
  final TextEditingController name = TextEditingController();
  final TextEditingController location = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController location_cont = TextEditingController();
  final TextEditingController descraption = TextEditingController();
  final TextEditingController image = TextEditingController();

  final GlobalKey<FormState> fkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: fkey,
          child: Column(
            children: [
              Container(
                child: SvgPicture.asset("assets/images/2.svg"),
                height: MediaQuery.of(context).size.height / 3.75,
                width: double.infinity,
                decoration: const BoxDecoration(),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign UP ", style: TextStyle(fontSize: 30)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Register with your valid email address  ",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 40,
                          color: Colors.black,
                          height: 5,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Textform(
                      val: (p0) {
                        if (p0!.isNotEmpty) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p0)) {
                            return 'Email format is wrong';
                          }
                        } else
                          return 'Email can\'t be empty';
                      },
                      controller: name,
                      text: 'Hotel Name',
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                      val: (p0) {
                        if (p0!.isNotEmpty) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p0)) {
                            return 'Email format is wrong';
                          }
                        } else
                          return 'Email can\'t be empty';
                      },
                      controller: emailController,
                      text: 'Email Address',
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                      val: (p0) {
                        if (p0!.isNotEmpty) {
                          if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
                                  .hasMatch(p0) ||
                              p0.length < 6) {
                            return 'password format is wrong';
                          }
                          // setState(() {
                          // password = p0;
                          // });
                        } else
                          return 'password can\'t be empty';
                        return null;
                      },
                      controller: passwordController,
                      text: 'Password',
                      obscure: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                      val: (p0) {
                        if (p0!.isNotEmpty) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p0)) {
                            return 'Email format is wrong';
                          }
                        } else
                          return 'Email can\'t be empty';
                      },
                      controller: location,
                      text: 'Location ',
                      suffix: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Map();
                            }));
                          },
                          icon: Icon(Icons.location_on)),
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textform(
                      val: (p0) {
                        if (p0!.isNotEmpty) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p0)) {
                            return 'Email format is wrong';
                          }
                        } else
                          return 'Email can\'t be empty';
                      },
                      controller: location,
                      text: 'Location_descraption ',
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                      val: (p0) {
                        if (p0!.isNotEmpty) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p0)) {
                            return 'Email format is wrong';
                          }
                        } else
                          return 'Email can\'t be empty';
                      },
                      controller: descraption,
                      text: 'descraption ',
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textform(
                      val: (p0) {
                        if (p0!.isNotEmpty) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p0)) {
                            return 'Email format is wrong';
                          }
                        } else
                          return 'Email can\'t be empty';
                      },
                      controller: image,
                      text: 'Tab to add image ',
                      suffix:
                          IconButton(onPressed: () {}, icon: Icon(Icons.image)),
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RecButton(
                          fun: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return login_hotel();
                            }));
                          },
                          color: Colors.white,
                          height: 40,
                          width: 120,
                          label: Text(
                            'Sign UP',
                            style: mainbfont,
                          ),
                        ),
                        RecButton(
                          fun: () async {
                            try {
                              var headers = {
                                'Accept': 'application/json',
                                'Cookie': 'HttpOnly'
                              };
                              var data = FormData.fromMap({
                                'name': name.text,
                                'email': emailController.text,
                                'password': passwordController.text,
                                'location_desc': descraption.text,
                              });

                              var dio = Dio();
                              var response = await dio.request(
                                '$hotelreg',
                              );

                              if (response.statusCode == 200) {
                                print('token');
                                print(response.data['data']['token']);
                                prefs!.setString(
                                    'token', (response.data['data']['token']));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Loginpage(),
                                    ));
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("there is an error"),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          color: Colors.black,
                          height: 40,
                          width: 120,
                          label: Text(
                            'Sign In',
                            style: mainwfont,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
