import 'package:flutter/material.dart';
import 'package:glyco/widgets/appBars/settings_app_bar.dart';
import '../providers/options.dart';
import '../providers/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './change_settings_screen.dart';

//Widgets
import 'package:glyco/widgets/shortcuts/shortcuts_summary.dart';
import 'package:glyco/widgets/mainSettings/export_data_button.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Options>(context).settings;
    return Scaffold(
      appBar: SettingsAppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Provider.of<Auth>(context).userName,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20),
                    changeSettings(),
                  ],
                ),
                Text(
                  Provider.of<Auth>(context).userEmail,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Spacer(),
                    ExportDataButton(),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Shortcuts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "Click on any shortcut to edit",
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                ChangeNotifierProvider.value(
                  value: settings,
                  child: ShortcutsSummary(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: logoutButton(),
            ),
          ],
        ),
      ),
    );
  }

  IconButton changeSettings() {
    return IconButton(
      icon: Icon(
        FontAwesomeIcons.cog,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChangeSettingsScreen()))
            .then((value) {
          setState(() {
            // refresh state of Page1
          });
        });
      },
    );
  }

  Row logoutButton() {
    return Row(
      children: [
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            width: 250,
            height: 40,
            color: Colors.red,
            child: FlatButton(
              child: Text(
                "LOGOUT",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Provider.of<Auth>(context, listen: false).logout();
              },
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
