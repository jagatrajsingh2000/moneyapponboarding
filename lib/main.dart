import 'package:flutter/material.dart';
// import 'pages/on_boarding_screen.dart'; 
import 'pages/home.dart';
import 'pages/loginsignup.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'on boarding',
      home: HomeScreen(),
    );
  }
}
