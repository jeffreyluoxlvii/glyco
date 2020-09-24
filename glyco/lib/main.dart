import 'package:flutter/material.dart';
import 'screens/navigation_screen.dart';
import 'package:provider/provider.dart';
import 'providers/measurements.dart';
import 'screens/login_screen.dart';
import 'screens/change_settings_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Measurements(),
        ),
      ],
      child: MaterialApp(
        home: LoginScreen(),
        routes: <String, WidgetBuilder>{
          '/NavScreen': (context) => NavigationScreen(),
          '/ChangeSettings': (context) => ChangeSettingsScreen(),
        },
        theme: ThemeData(
          primaryColor: Colors.pink[300],
          accentColor: Colors.blue[450],
          appBarTheme: AppBarTheme(
            color: Colors.grey[200],
          ),
        ),
      ),
    );
  }
}
