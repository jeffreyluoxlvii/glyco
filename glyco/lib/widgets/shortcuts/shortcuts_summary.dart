import 'package:flutter/material.dart';
import 'package:glyco/providers/settings.dart';
import 'package:provider/provider.dart';
import '../../providers/options.dart';
import '../../widgets/shortcuts/nutrition_shortcut_form.dart';
import '../../widgets/shortcuts/exercise_shortcut_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShortcutsSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final options = Provider.of<Options>(context);
    InkWell editShortcut(icon, label, measurement) {
      return InkWell(
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 45,
            ),
            Column(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                  child: measurement,
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: ChangeNotifierProvider.value(
                    child: label == "ACTIVITY"
                        ? ExerciseShortcutForm()
                        : ShortcutForm(icon, label),
                    value: options,
                  ),
                ),
              );
            },
          );
        },
      );
    }

    final settings = Provider.of<Settings>(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: editShortcut(
                  FontAwesomeIcons.hamburger,
                  "MEAL",
                  Text(" ${settings.mealCarbs}g carbs"),
                ),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: editShortcut(
                  FontAwesomeIcons.cookie,
                  "SNACK",
                  Text(" ${settings.snackCarbs}g carbs"),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: editShortcut(
                  FontAwesomeIcons.mugHot,
                  "DRINK",
                  Text(" ${settings.drinkCarbs}g carbs"),
                ),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: editShortcut(
                  FontAwesomeIcons.running,
                  "ACTIVITY",
                  Text("${settings.exerciseTime} minutes"),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
