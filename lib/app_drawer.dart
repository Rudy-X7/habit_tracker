// lib/app_drawer.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart'; // For navigation after logout

class AppDrawer extends StatelessWidget {
  final String userName;

  const AppDrawer({super.key, required this.userName});

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear user data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue.shade700),
            accountName: Text('Hello, $userName!', style: TextStyle(fontSize: 18)),
            accountEmail: Text('Welcome back 👋'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue.shade700, size: 40),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configure'),
            onTap: () {}, // Implement if needed
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Personal Info'),
            onTap: () {}, // Implement if needed
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Reports'),
            onTap: () {}, // Implement if needed
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {}, // Implement if needed
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
