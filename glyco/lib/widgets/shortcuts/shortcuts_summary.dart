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
              FontAwesomeIcons.heartbeat,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Text("Manual Input"),
            Spacer(),
            Icon(
              FontAwesomeIcons.hamburger,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Text(
                " ${settings.mealCalories} kcal\n ${settings.mealCarbs}g carbs"),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.cookie,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Text(
                " ${settings.snackCalories} kcal\n ${settings.snackCarbs}g carbs"),
            Spacer(),
            Icon(
              FontAwesomeIcons.coffee,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Text(
                " ${settings.drinkCalories} kcal\n ${settings.drinkCarbs} carbs"),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.running,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Text("${settings.exerciseTime} min activity"),
          ],
        ),
      ],
    );
  }
}
