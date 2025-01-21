import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> settingsOptions = [
    {'icon': Icons.account_circle, 'label': 'Account Settings'},
    {'icon': Icons.notifications, 'label': 'Notifications'},
    {'icon': Icons.lock, 'label': 'Privacy & Security'},
    {'icon': Icons.language, 'label': 'Language'},
    {'icon': Icons.help, 'label': 'Help & Support'},
    {'icon': Icons.info, 'label': 'About'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: settingsOptions.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(settingsOptions[index]['icon'], color: Colors.green),
              title: Text(settingsOptions[index]['label']),
              onTap: () {
                // Handle settings tap (e.g., navigate to another screen)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${settingsOptions[index]['label']}')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
