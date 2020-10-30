import 'package:flutter/material.dart';
import 'package:glyco/providers/settings.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShortcutsSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Settings>(context);
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.hamburger,
                    color: Theme.of(context).primaryColor,
                    size: 45,
                  ),
                  Column(
                    children: [
                      Text(
                        "MEAL",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Text(" ${settings.mealCarbs}g carbs"),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                print("Burger");
              },
            ),
            Spacer(),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.cookie,
                    color: Theme.of(context).primaryColor,
                    size: 45,
                  ),
                  Column(
                    children: [
                      Text(
                        "SNACK",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Text(" ${settings.snackCarbs}g carbs"),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                print("Cookie");
              },
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            InkWell(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.mugHot,
                    color: Theme.of(context).primaryColor,
                    size: 45,
                  ),
                  Column(
                    children: [
                      Text(
                        "DRINK",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Text(" ${settings.drinkCarbs}g carbs"),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                print("Drink");
              },
            ),
            Spacer(),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.running,
                    color: Theme.of(context).primaryColor,
                    size: 45,
                  ),
                  Column(
                    children: [
                      Text(
                        "ACTIVITY",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Text("${settings.exerciseTime} minutes"),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                print("Run");
              },
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
