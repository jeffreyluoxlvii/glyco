import 'package:flutter/material.dart';

class ChangeSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Glyco")),
      body: exportData(context),
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