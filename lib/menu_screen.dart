import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Welcome, User!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          // Menu Options
          _buildMenuItem(
            context,
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.list_alt,
            title: 'My Habits',
            onTap: () {
              Navigator.pushNamed(context, '/habits');
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.bar_chart,
            title: 'Statistics',
            onTap: () {
              Navigator.pushNamed(context, '/stats');
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),

          const Divider(height: 40),

          _buildMenuItem(
            context,
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              // Add logout logic here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
