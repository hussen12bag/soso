import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_finder/Auth_Screen/hotel_auth/login_hotel.dart';
import 'package:hotel_finder/Map/map.dart';
import 'package:hotel_finder/components/Text_form.dart';
import 'package:hotel_finder/components/rectangular_button.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
// import 'package:image_picker/image_picker.dart';

class Reg_hotel extends StatefulWidget {
  const Reg_hotel({Key? key}) : super(key: key);

  @override
  State<Reg_hotel> createState() => _Reg_hotelState();
}

class _Reg_hotelState extends State<Reg_hotel> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descraptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? _selectedImage;

  Future<void> registerHotel() async {
    if (formKey.currentState!.validate()) {
      // Prepare data to send
      FormData formData = FormData.fromMap({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'location': locationController.text,
        'descraption': descraptionController.text,
        'image': await MultipartFile.fromFile(imageController.text,
            filename: 'image.jpg'),
      });

      try {
        Response response = await Dio()
            .post('http://127.0.0.1:8000/api/hotelRegister', data: formData);

        // Handle response as per your API's expected response
        print(response.data);

        // Example handling success:
        if (response.statusCode == 200) {
          // Show success message or navigate to next screen
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Hotel registered successfully')));
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to register hotel')));
        }
      } catch (e) {
        // Handle error
        print(e.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  // Future<void> pickImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _selectedImage = File(pickedFile.path);
  //       imageController.text = pickedFile.path;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  child: SvgPicture.asset("assets/images/2.svg"),
                  height: MediaQuery.of(context).size.height / 3.75,
                  width: double.infinity,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sign UP ", style: TextStyle(fontSize: 30)),
                          SizedBox(height: 10),
                          Text("Register with your valid email address "),
                          SizedBox(height: 10),
                          Container(
                            width: 40,
                            color: Colors.black,
                            height: 5,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Textform(
                        val: (value) {
                          if (value!.isEmpty) {
                            return 'Hotel name cannot be empty';
                          }
                          return null;
                        },
                        controller: nameController,
                        text: 'Hotel Name',
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 10),
                      Textform(
                        val: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                        controller: emailController,
                        text: 'Email Address',
                        obscure: false,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10),
                      Textform(
                        val: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
                              .hasMatch(value)) {
                            return 'Password must be at least 6 characters long and contain at least one uppercase letter, one lowercase letter, and one digit';
                          }
                          return null;
                        },
                        controller: passwordController,
                        text: 'Password',
                        obscure: true,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 10),
                      Textform(
                        val: (value) {
                          if (value!.isEmpty) {
                            return 'Location cannot be empty';
                          }
                          return null;
                        },
                        controller: locationController,
                        text: 'Location',
                        suffix: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Map();
                            }));
                          },
                          icon: Icon(Icons.location_on),
                        ),
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 10),
                      Textform(
                        val: (value) {
                          if (value!.isEmpty) {
                            return 'Description cannot be empty';
                          }
                          return null;
                        },
                        controller: descraptionController,
                        text: 'Description',
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 10),
                      Textform(
                        val: (value) {
                          if (value!.isEmpty) {
                            return 'Image cannot be empty';
                          }
                          return null;
                        },
                        controller: imageController,
                        text: 'Image',
                        suffix: IconButton(
                          onPressed: () {
                            // pickImage();
                          },
                          icon: Icon(Icons.image),
                        ),
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RecButton(
                            fun: registerHotel,
                            color: Colors.white,
                            height: 40,
                            width: 120,
                            label: Text('Sign UP',
                                style: TextStyle(color: Colors.black)),
                          ),
                          RecButton(
                            fun: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return login_hotel();
                              }));
                            },
                            color: Colors.black,
                            height: 40,
                            width: 120,
                            label: Text('Sign In',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
