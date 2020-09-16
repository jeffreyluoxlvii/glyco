import 'package:flutter/material.dart';
import 'screens/navigation_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationScreen(),
    );
  }
}
