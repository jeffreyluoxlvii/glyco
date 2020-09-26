import 'package:flutter/material.dart';
import 'package:glyco/providers/options.dart';
import 'package:provider/provider.dart';

//Widgets

import 'package:glyco/widgets/mainSettings/editShortcuts/food_rows.dart';
import 'package:glyco/widgets/mainSettings/editShortcuts/glucose_row.dart';
import 'package:glyco/widgets/mainSettings/editShortcuts/exercise_row.dart';

class EditShortcuts extends StatelessWidget {
  ExerciseRow exerciseRow;
  FoodRow mealRow;
  FoodRow snackRow;
  FoodRow drinkRow;
  var settings;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Glyco",
            style: TextStyle(color: Colors.black),
          )),
      body: changeSettings(context),
    );
  }

  Container changeSettings(context) {
    settings = Provider.of<Options>(context).settings;
    exerciseRow = ExerciseRow(
        icon: Icon(
          Icons.directions_run,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        minutes: '${settings.exerciseTime}');
    mealRow = FoodRow(
        icon: Icon(
          Icons.fastfood,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        kcal: '${settings.mealCalories}',
        carbs: '${settings.mealCarbs}');
    snackRow = FoodRow(
        icon: Icon(
          Icons.donut_small,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        kcal: '${settings.snackCalories}',
        carbs: '${settings.snackCarbs}');
    drinkRow = FoodRow(
        icon: Icon(
          Icons.free_breakfast,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        kcal: '${settings.drinkCalories}',
        carbs: '${settings.drinkCarbs}');
    return Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Edit Shortcuts",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                )),
            SizedBox(height: 30),
            GlucoseRow(
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).primaryColor,
                  size: 45,
                ),
                measurement: 'Manual Input'),
            SizedBox(height: 30),
            mealRow,
            SizedBox(height: 30),
            snackRow,
            SizedBox(height: 30),
            drinkRow,
            SizedBox(height: 30),
            exerciseRow,
            SizedBox(height: 30),
            Row(
              children: [
                cancel(context),
                Spacer(),
                saveAndExit(context),
              ],
            ),
          ],
        ));
  }

  ClipRRect saveAndExit(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 150,
        height: 40,
        color: Colors.blue[300],
        child: FlatButton(
          child: Text("SAVE & EXIT",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            if (mealRow.kcalController.text.length > 0 &&
                mealRow.carbController.text.length > 0) {
              settings.setMealSettings(int.parse(mealRow.kcalController.text),
                  int.parse(mealRow.carbController.text));
            }
            if (snackRow.kcalController.text.length > 0 &&
                snackRow.carbController.text.length > 0) {
              settings.setMealSettings(int.parse(snackRow.kcalController.text),
                  int.parse(snackRow.carbController.text));
            }
            if (drinkRow.kcalController.text.length > 0 &&
                drinkRow.carbController.text.length > 0) {
              settings.setMealSettings(int.parse(drinkRow.kcalController.text),
                  int.parse(drinkRow.carbController.text));
            }
            if (exerciseRow.exerciseController.text.length > 0) {
              settings.setExerciseTime(
                  int.parse(exerciseRow.exerciseController.text));
            }
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ClipRRect cancel(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 150,
        height: 40,
        color: Colors.grey,
        child: FlatButton(
          child: Text("CANCEL",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
