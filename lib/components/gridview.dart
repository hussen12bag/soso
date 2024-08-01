import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gridview extends StatefulWidget {
  var body;
  Gridview({super.key, required this.body});

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Python Ai Cource  ",
      "Lesson": "20 Lesson",
      "images":
          "https://media.istockphoto.com/id/119926339/photo/resort-swimming-pool.jpg?s=612x612&w=0&k=20&c=9QtwJC2boq3GFHaeDsKytF4-CavYKQuy1jBD2IRfYKc=",
    },
    {
      "title": "Python Ai Cource  ",
      "Lesson": "15 Lesson ",
      "images":
          "https://ojt.com/wp-content/uploads/2021/08/python-programming-language.png",
    },
    {
      "title": "Flutter&Dart Cource",
      "Lesson": "48 Lesson",
      "images":
          "https://solguruz.com/_next/image/?url=https%3A%2F%2Fblog.solguruz.com%2Fwp-content%2Fuploads%2F2023%2F11%2FFlutter-App-Development-Cost-A-Complete-Guide.png&w=1080&q=75",
    },
    {
      "title": "Web Developer full Cource ",
      "Lesson": "20 Lesson",
      "images":
          "https://thumbs.dreamstime.com/b/programmer-working-program-web-developer-coding-computer-screen-code-script-open-windows-coder-engineer-vector-208530984.jpg",
    },
    {
      "title": "Flutter&Dart Cource",
      "Lesson": "48 Lesson",
      "images":
          "https://solguruz.com/_next/image/?url=https%3A%2F%2Fblog.solguruz.com%2Fwp-content%2Fuploads%2F2023%2F11%2FFlutter-App-Development-Cost-A-Complete-Guide.png&w=1080&q=75",
    },
    {
      "title": "Python Ai Cource  ",
      "Lesson": "15 Lesson ",
      "images":
          "https://ojt.com/wp-content/uploads/2021/08/python-programming-language.png",
    },
    {
      "title": "Web Developer full Cource ",
      "Lesson": "20 Lesson",
      "images":
          "https://thumbs.dreamstime.com/b/programmer-working-program-web-developer-coding-computer-screen-code-script-open-windows-coder-engineer-vector-208530984.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return widget.body == null ? Text("lll") : Text("f");
  }
}
