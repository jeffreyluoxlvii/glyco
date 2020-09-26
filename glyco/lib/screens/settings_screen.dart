import 'package:flutter/material.dart';

//Widgets
import 'package:glyco/widgets/shortcuts/shortcuts_summary.dart';
import 'package:glyco/widgets/mainSettings/export_data.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/pepe.jpg',
                    height: 250,
                    width: 250,
                  ),
                  Spacer(),
                ]),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jessica Woodard",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "jess.woodard@gmail.com",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(children: [
                      Spacer(),
                      exportData(),
                      Spacer(),
                    ]),
                    SizedBox(height: 15),
                    Text(
                      "Shortcuts",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 15),
                    shortcutsSummary(),
                    SizedBox(height: 15),
                    Text(
                      "Integrations",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
