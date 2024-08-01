import 'package:flutter/material.dart';

class ProfileDisplayScreen extends StatelessWidget {
  // بيانات افتراضية للمستخدم
  final String profileImage = 'assets/profile_picture.png';
  final String fullName = 'John Doe';
  final String gender = 'Male';
  final DateTime birthDate = DateTime(1990, 1, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(height: 20),
            Text(
              fullName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Gender: $gender',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              'Date of Birth: ${birthDate.day}/${birthDate.month}/${birthDate.year}',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
