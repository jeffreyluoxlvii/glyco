import 'package:flutter/material.dart';
import 'package:glyco/providers/options.dart';
import 'package:provider/provider.dart';

//Widgets

import 'package:glyco/widgets/mainSettings/editShortcuts/food_rows.dart';
import 'package:glyco/widgets/mainSettings/editShortcuts/glucose_row.dart';
import 'package:glyco/widgets/mainSettings/editShortcuts/exercise_row.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditShortcuts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Options>(context).settings;
    ExerciseRow exerciseRow = ExerciseRow(
        icon: Icon(
          FontAwesomeIcons.running,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        minutes: '${settings.exerciseTime}');
    FoodRow mealRow = FoodRow(
        icon: Icon(
          FontAwesomeIcons.hamburger,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        kcal: '${settings.mealCalories}',
        carbs: '${settings.mealCarbs}');
    FoodRow snackRow = FoodRow(
        icon: Icon(
          FontAwesomeIcons.cookie,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        kcal: '${settings.snackCalories}',
        carbs: '${settings.snackCarbs}');
    FoodRow drinkRow = FoodRow(
        icon: Icon(
          FontAwesomeIcons.coffee,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        kcal: '${settings.drinkCalories}',
        carbs: '${settings.drinkCarbs}');
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Glyco",
            style: TextStyle(color: Colors.black),
          )),
      body: Container(
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
                  FontAwesomeIcons.heartbeat,
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
                CancelButton(),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 150,
                    height: 40,
                    color: Colors.cyanAccent[400],
                    child: FlatButton(
                      child: Text("SAVE & EXIT",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      onPressed: () {
                        if (mealRow.kcalController.text.length > 0 &&
                            mealRow.carbController.text.length > 0) {
                          settings.setMealSettings(
                              int.parse(mealRow.kcalController.text),
                              int.parse(mealRow.carbController.text));
                        }
                        if (snackRow.kcalController.text.length > 0 &&
                            snackRow.carbController.text.length > 0) {
                          settings.setSnackSettings(
                              int.parse(snackRow.kcalController.text),
                              int.parse(snackRow.carbController.text));
                        }
                        if (drinkRow.kcalController.text.length > 0 &&
                            drinkRow.carbController.text.length > 0) {
                          settings.setDrinkSettings(
                              int.parse(drinkRow.kcalController.text),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 150,
        height: 40,
        color: Colors.grey[400],
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
