import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  final String username;
  
  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}