import 'package:flutter/material.dart';
import 'package:glyco/providers/options.dart';
import 'package:provider/provider.dart';

class ShortcutsSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Options>(context).settings;
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Text("Manual Input"),
            Spacer(),
            Icon(
              Icons.fastfood,
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
              Icons.donut_small,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Text(
                " ${settings.snackCalories} kcal\n ${settings.snackCarbs}g carbs"),
            Spacer(),
            Icon(
              Icons.free_breakfast,
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
              Icons.directions_run,
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
