import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/navigation_screen.dart';
import 'providers/measurements.dart';
import 'providers/options.dart';
//Screens
import 'screens/login_screen.dart';
import 'screens/change_settings_screen.dart';
import 'screens/edits/edit_shortcuts_screen.dart';
import 'screens/accounts/create_account_screen.dart';
import 'screens/accounts/change_password_screen.dart';
import 'screens/accounts/forgot_password_screen.dart';

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
        ChangeNotifierProvider(
          create: (ctx) => Options(),
        )
      ],
      child: MaterialApp(
        home: LoginScreen(),
        routes: <String, WidgetBuilder>{
          '/NavScreen': (context) => NavigationScreen(),
          '/ChangeSettings': (context) => ChangeSettingsScreen(),
          '/EditShortcuts': (context) => EditShortcuts(),
          '/CreateAccount': (context) => CreateAccount(),
          '/ChangePassword': (context) => ChangePassword(),
          '/ForgotPassword': (context) => ForgotPassword(),
        },
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.cyan,
          primaryColor: Colors.pink[300],
          accentColor: Colors.cyanAccent[400],
          appBarTheme: AppBarTheme(
            color: Colors.grey[200],
          ),
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 24.0),
            bodyText2: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
