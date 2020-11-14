import 'package:flutter/material.dart';
import 'package:glyco/providers/settings.dart';
import 'package:provider/provider.dart';
import 'screens/navigation_screen.dart';
import 'providers/measurements.dart';
import 'providers/options.dart';
import 'providers/auth.dart';

//Screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/change_settings_screen.dart';
import 'screens/accounts/create_account_screen.dart';
import 'screens/accounts/change_password_screen.dart';
import 'screens/accounts/change_email_screen.dart';
import 'screens/accounts/change_name_screen.dart';
import 'screens/accounts/forgot_password_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Measurements>(
          update: (ctx, auth, previousMeasurements) => Measurements(
            auth.token,
            auth.userId,
            previousMeasurements == null
                ? []
                : previousMeasurements.measurements,
          ),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Options>(
          update: (ctx, auth, previousOptions) => Options(
            auth.token,
            auth.userId,
            previousOptions == null
                ? Settings(
                    mealCarbs: 35,
                    snackCarbs: 15,
                    drinkCarbs: 10,
                    exerciseTime: 30,
                    userId: auth.userId,
                  )
                : previousOptions.settings,
          ),
          create: null,
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          home: //LoginScreen(),
              auth.isAuth
                  ? NavigationScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : auth.isAuth
                                  ? NavigationScreen()
                                  : LoginScreen(),
                    ),
          routes: <String, WidgetBuilder>{
            '/NavScreen': (context) => NavigationScreen(),
            '/ChangeSettings': (context) => ChangeSettingsScreen(),
            '/CreateAccount': (context) => CreateAccount(),
            '/ChangePassword': (context) => ChangePassword(),
            '/ChangeEmail': (context) => ChangeEmail(),
            '/ChangeName': (context) => ChangeName(),
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
      ),
    );
  }
}
