import 'package:flutter/material.dart';
import 'package:lat_kuis/screens/home.dart';
import 'screens/login_screen.dart';
import 'package:lat_kuis/models/data.dart';
import 'package:lat_kuis/screens/detail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Text("Home")), body: HomeScreen()),
    );
  }
}
