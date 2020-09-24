import 'package:flutter/material.dart';
import 'package:glyco/screens/challenges_screen.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: settingsScreen(context),
    );
  }

  Widget settingsScreen(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.ac_unit,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
          child: Text(
            "Jessica Woodard",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Text(
          "jess.woodard@gmail.com",
          style: TextStyle(
            fontSize: 16
          )
        ),
        exportData(context),
        Text(
          "Shortcuts",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          )
        ),
        Text(
          "Integrations",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          )
        ),
      ],
    );
  }

  ClipRRect exportData(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        width: 250,
        height: 40,
        color: Colors.blue[300],
        child: FlatButton(
          child: Text("EXPORT DATA",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            Navigator.pushNamed(context, '/NavScreen');
          },
        ),
      ),
    );
  }
}

