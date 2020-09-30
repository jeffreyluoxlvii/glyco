import 'package:flutter/material.dart';
import './challenges_screen.dart';
import './measures_screen.dart';
import './settings_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 1;

  static List<Widget> _screens = <Widget>[
    ChallengesScreen(),
    MeasuresScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showSettings() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 45,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bars),
            title: Text('Challenges'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.table),
            title: Text('Measures'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cog),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
