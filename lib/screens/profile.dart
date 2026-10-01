import 'package:flutter/material.dart';
import 'package:lat_kuis/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  const ProfileScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          Text("Username", style: TextStyle(color: Colors.grey)),
          Text(
            username,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout),
            label: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
