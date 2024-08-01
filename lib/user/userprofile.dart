import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  File? profileImage;
  DateTime? dateTime;
  String? gender;
  String? fullName = "John Doe";
  String? image = 'assets/profile_picture.png'; // صورة افتراضية
  List<NameAndId> genders = [
    NameAndId(name: "Male", id: "male"),
    NameAndId(name: "Female", id: "female")
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            image != null ? AssetImage(image!) : null,
                        child:
                            image == null ? Icon(Icons.person, size: 60) : null,
                      ),
                      IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () {
                          // قم بإضافة وظيفتك لتحميل صورة
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: fullName,
                  decoration: InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      fullName = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: gender,
                  items: genders.map((gender) {
                    return DropdownMenuItem(
                      value: gender.id,
                      child: Text(gender.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Gender'),
                ),
                SizedBox(height: 20),
                Text(
                  'Date of Birth',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: dateTime ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        dateTime = pickedDate;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(dateTime == null
                            ? 'Select your birthdate'
                            : "${dateTime!.day}/${dateTime!.month}/${dateTime!.year}"),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      // تنفيذ عملية الحفظ أو التحديث هنا
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameAndId {
  final String name;
  final String id;

  NameAndId({required this.name, required this.id});
}
