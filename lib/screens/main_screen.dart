import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'transfer_screen.dart';
import 'services_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  final String fullName; // Receive full name

  const MainScreen({Key? key, required this.fullName}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late List<Widget> _screens; // Declare screens here to include fullName

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(fullName: widget.fullName), // Pass fullName to HomeScreen
      TransferScreen(),
      ServicesScreen(),
      SettingsScreen(),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transfer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
