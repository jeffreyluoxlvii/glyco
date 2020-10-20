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
            Icon(
              FontAwesomeIcons.hamburger,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(" ${settings.mealCarbs}g carbs"),
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.cookie,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(" ${settings.snackCarbs}g carbs"),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.mugHot,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Padding(
              // TODO: figure out what's going on with the padding (make these into containers?)
              padding: const EdgeInsets.all(10.0),
              child: Text(" ${settings.drinkCarbs}g carbs"),
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.running,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${settings.exerciseTime} minutes"),
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
