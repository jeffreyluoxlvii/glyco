import 'package:flutter/material.dart';
import '../screens/edits/edit_profile_screen.dart';

//Widgets
import '../widgets/appBars/plain_app_bar_back.dart';

//Author: Justin Wu

//This class creates the screen that is shown when a user wants to change their profile information.
//It contains the widgets created in edit_profile_screen.dart
class ChangeSettingsScreen extends StatefulWidget {
  @override
  _ChangeSettingsScreenState createState() => _ChangeSettingsScreenState();
}

class _ChangeSettingsScreenState extends State<ChangeSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlainAppBarBack(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
