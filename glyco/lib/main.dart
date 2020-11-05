import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/navigation_screen.dart';
import 'providers/measurements.dart';
import 'providers/options.dart';
import 'providers/auth.dart';

//Screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/change_settings_screen.dart';
import 'screens/edits/edit_shortcuts_screen.dart';
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
        ChangeNotifierProvider(
          create: (ctx) => Options(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          home: //LoginScreen(),
              auth.isAuth
                  ? NavigationScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) => authResultSnapshot
                                  .connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : auth.isAuth ? NavigationScreen() : LoginScreen(),
                    ),
          routes: <String, WidgetBuilder>{
            '/NavScreen': (context) => NavigationScreen(),
            '/ChangeSettings': (context) => ChangeSettingsScreen(),
            '/EditShortcuts': (context) => EditShortcuts(),
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
// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'package:nano_healthkit_plugin/nano_healthkit_plugin.dart';
// import 'package:nano_healthkit_plugin/healthdata.pb.dart';
// import 'package:nano_healthkit_plugin/healthdata.pbenum.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isAuthorized = false;
//   String _basicHealthString = "";
//   String _statisticsString = "";
//   String _exisitngTypesString = "";
//   String _updateMessageString = "";
//   bool _isSubscribed = false;
//   String _pulledBackgroundDataString = "";
//   String _batchString = "";

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     await NanoHealthkitPlugin.initialize(_updatesReceivedInBackground);
//     bool _isSubscribed = await NanoHealthkitPlugin.isSubscribedToUpdates();
//     setState(() {
//       this._isSubscribed = _isSubscribed;
//     });
//   }

//   _authorize() async {
//     var request = HealthTypeList();
//     request.types.add(
//         HealthTypes.QUANTITY_BLOOD_GLUCOSE); //permissions to real blood glucose
//     request.types
//         .add(HealthTypes.QUANTITY_STEP_COUNT); // Permissions to read steps
//     bool isAuthorized = await NanoHealthkitPlugin.authorize(request);
//     setState(() {
//       _isAuthorized = isAuthorized;
//     });
//   }

//   _getUserBasicHealthData() async {
//     var request = HealthDataRequest();
//     request.type = HealthTypes.QUANTITY_BLOOD_GLUCOSE;
//     //request.startDate = "2019-06-19T18:58:00.000Z";
//     //request.endDate = "2019-09-19T20:58:00.000Z";
//     //request.limit = 2;
//     //request.units.add("ft");
//     // request.units.add("kcal");
//     // request.units.add("km");
//     var resultToShow = "";
//     try {
//       var basicHealth = await NanoHealthkitPlugin.fetchData(request);
//       resultToShow = basicHealth.toString();
//     } on Exception catch (error) {
//       resultToShow = error.toString();
//     }
//     setState(() {
//       _basicHealthString = resultToShow;
//     });
//   }

//   _getUserBatchData() async {
//     // First get the list of existing types
//     var existingTypesReq = HealthTypeList();
//     existingTypesReq.types.addAll(HealthTypes.values);
//     var existingTypes =
//         await NanoHealthkitPlugin.filterExistingTypes(existingTypesReq);

//     // Make the request for all types
//     var requestList = HealthDataRequestList();
//     for (var type in existingTypes.types) {
//       var typeRequest = HealthDataRequest();
//       typeRequest.type = type;
//       requestList.requests.add(typeRequest);
//     }

//     var resultToShow = "";
//     try {
//       var batchHealth = await NanoHealthkitPlugin.fetchBatchData(requestList);
//       print(batchHealth);
//       resultToShow = batchHealth.toString();
//     } on Exception catch (error) {
//       resultToShow = error.toString();
//     }
//     setState(() {
//       _batchString = resultToShow;
//     });
//   }

//   _getUserStatisticsData() async {
//     var request = StatisticsRequest();
//     request.type = HealthTypes.QUANTITY_HEART_RATE;
//     request.options.add(StatisticsOptions.DISCRETE_MAX);
//     request.options.add(StatisticsOptions.DISCRETE_MIN);
//     request.options.add(StatisticsOptions.DISCRETE_AVERAGE);
//     request.options.add(StatisticsOptions.SEPARATE_BY_SOURCE);
//     var resultToShow = "";
//     try {
//       var result = await NanoHealthkitPlugin.fetchStatisticsData(request);
//       resultToShow = result.toString();
//     } on Exception catch (error) {
//       resultToShow = error.toString();
//     }
//     setState(() {
//       _statisticsString = resultToShow;
//     });
//   }

//   _filterExistingTypes() async {
//     var request = HealthTypeList();
//     request.types.addAll(HealthTypes.values);
//     var filtered = await NanoHealthkitPlugin.filterExistingTypes(request);
//     setState(() {
//       _exisitngTypesString = filtered.toString();
//     });
//   }

//   _subscribeToUpdates() {
//     var request = HealthTypeList();
//     request.types.addAll(HealthTypes.values); // Subscribe to everything
//     NanoHealthkitPlugin.subscribeToUpdates(request, _updatesReceived);
//     setState(() {
//       _isSubscribed = true;
//       _updateMessageString = "";
//     });
//   }

//   _unsubscribeToUpdates() {
//     NanoHealthkitPlugin.unsubscribeToUpdates();
//     setState(() {
//       _isSubscribed = false;
//       _updateMessageString = "";
//     });
//   }

//   _updatesReceived(HealthDataList updates) {
//     _saveUpdateData(updates);
//     setState(() {
//       _updateMessageString = updates.toString();
//     });
//   }

//   _updatesReceivedInBackground(HealthDataList updates) {
//     _saveUpdateData(updates);
//   }

//   _saveUpdateData(HealthDataList updates) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> saves = prefs.getStringList("savedUpdates") ?? List<String>();
//     saves.add(updates.toString() + "\n");
//     prefs.setStringList("savedUpdates", saves);
//   }

//   _pullSavedData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> saves = prefs.getStringList("savedUpdates") ?? List<String>();
//     setState(() {
//       _pulledBackgroundDataString = saves.toString();
//     });
//     saves.clear();
//     prefs.setStringList("savedUpdates", List<String>());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Plugin example app'),
//         ),
//         body: Center(
//           child: ListView(
//             shrinkWrap: true,
//             padding: EdgeInsets.all(15.0),
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: RaisedButton(
//                     child: Text("Authorize"),
//                     onPressed: () {
//                       _authorize();
//                     }),
//               ),
//               Text('Authorized: $_isAuthorized\n'),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: RaisedButton(
//                     child: Text("Filter Only Existing Types"),
//                     onPressed: () {
//                       _filterExistingTypes();
//                     }),
//               ),
//               Text('Valid types: $_exisitngTypesString\n'),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: RaisedButton(
//                     child: Text(_isSubscribed
//                         ? "Unsubscribe to updates"
//                         : "Subscribe to updates"),
//                     onPressed: _isSubscribed
//                         ? _unsubscribeToUpdates
//                         : _subscribeToUpdates),
//               ),
//               Text('$_updateMessageString\n'),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: RaisedButton(
//                     child: Text("Pull saved updates"),
//                     onPressed: _pullSavedData),
//               ),
//               Text('Saved data: $_pulledBackgroundDataString\n'),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: RaisedButton(
//                     child: Text("Get basic data"),
//                     onPressed: _getUserBasicHealthData),
//               ),
//               Text('Basic health: $_basicHealthString\n'),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: RaisedButton(
//                     child: Text("Get statistics data"),
//                     onPressed: _getUserStatisticsData),
//               ),
//               Text('Statistics data: $_statisticsString\n'),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: RaisedButton(
//                     child: Text("Get batch data"),
//                     onPressed: _getUserBatchData),
//               ),
//               Text('Batch data: $_batchString\n'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
