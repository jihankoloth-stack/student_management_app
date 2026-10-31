
import 'package:flutter/material.dart';
import 'package:student_management/addpage.dart';
import 'package:student_management/home.dart';

void main(){
  runApp(Studentapp());
}
class Studentapp extends StatelessWidget {
  const Studentapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StudentApp",
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}