import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_finder/Auth_Screen/user_Auth/login_user.dart';
import 'package:hotel_finder/DB/links.dart';
import 'package:hotel_finder/components/Text_form.dart';
import 'package:hotel_finder/components/rectangular_button.dart';
import 'package:hotel_finder/theme/colors.dart';
import 'package:hotel_finder/theme/fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

int selectedtype = 0;

class _SignUpState extends State<SignUp> {
  final TextEditingController name = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> fkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    void _signUp() async {
      String userName = name.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // بيانات الجسم لإرسالها مع الطلب
      var body = {
        'name': userName,
        'email': email,
        'password': password,
      };

      try {
        // إرسال طلب POST باستخدام مكتبة http
        var response = await http.post(
          Uri.parse('http://10.0.2.2:8000/api/userRegister'),
          body: body,
        );

        // التحقق من حالة الاستجابة
        if (response.statusCode == 200) {
          // نجاح التسجيل
          print('Registered successfully!');
          // يمكنك عرض رسالة نجاح أو توجيه المستخدم إلى صفحة أخرى هنا
        } else {
          // فشل التسجيل
          print('Registration failed: ${response.body}');
          // يمكنك عرض رسالة خطأ هنا
        }
      } catch (e) {
        // معالجة الأخطاء
        print('Error registering: $e');
        // يمكنك عرض رسالة خطأ هنا
      }
    }

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
                      // val: (p0) {
                      //   if (p0!.isNotEmpty) {
                      //     if (!RegExp(
                      //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //         .hasMatch(p0)) {
                      //       return 'Email format is wrong';
                      //     }
                      //   } else
                      //     return 'Email can\'t be empty';
                      // },
                      controller: name,
                      text: 'Name ',
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
                      text: 'Email',
                      obscure: true,
                      textInputType: TextInputType.visiblePassword,
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
                      text: 'Password  ',
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
                          fun: () async {
                            _signUp();
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
                          fun: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Loginpage();
                            }));
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
