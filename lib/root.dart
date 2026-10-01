import 'package:flutter/material.dart';
import 'package:lat_kuis/screens/home.dart';
import 'package:lat_kuis/screens/profile.dart';

class Root extends StatefulWidget {
  final String username;

  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {

 int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      HomeScreen(),
      ProfileScreen(username: widget.username),
    ];
    List<String> titlescreen = ["Home", "Profile"];
    return Scaffold(
      appBar: AppBar(
        title: Text(titlescreen[_selectedIndex]),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}