import 'package:flutter/material.dart';
import 'package:glyco/screens/change_settings_screen.dart';

class SettingsAppBar extends StatefulWidget implements PreferredSizeWidget {
  SettingsAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _SettingsAppBarState createState() => _SettingsAppBarState();
}

class _SettingsAppBarState extends State<SettingsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Settings",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeSettingsScreen()))
                .then((value) {
              setState(() {
                // refresh state of Page1
              });
            });
          },
        ),
      ],
    );
  }
}
