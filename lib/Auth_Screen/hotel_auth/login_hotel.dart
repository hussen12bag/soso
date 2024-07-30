import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_finder/Auth_Screen/hotel_auth/regester_hotel.dart';
import 'package:hotel_finder/components/Text_form.dart';
import 'package:hotel_finder/components/rectangular_button.dart';
import 'package:hotel_finder/theme/fonts.dart';

class login_hotel extends StatefulWidget {
  const login_hotel({super.key});

  @override
  State<login_hotel> createState() => _login_hotelState();
}

class _login_hotelState extends State<login_hotel> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                        Text("Sign In ", style: TextStyle(fontSize: 30)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sign in to your  Registered Account ",
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
                      height: 40,
                    ),
                    Text("Forget Password ?"),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RecButton(
                          fun: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Reg_hotel();
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
