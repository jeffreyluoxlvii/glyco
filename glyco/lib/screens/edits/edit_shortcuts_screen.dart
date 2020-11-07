import 'package:flutter/material.dart';
import 'package:glyco/providers/auth.dart';
import 'package:glyco/providers/options.dart';
import 'package:provider/provider.dart';

//Widgets

import '../../widgets/mainSettings/editShortcuts/exercise_row.dart';
import '../../widgets/mainSettings/editShortcuts/food_rows.dart';
import '../../widgets/appBars/plain_app_bar.dart';

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
        carbs: '${settings.mealCarbs}');
    FoodRow snackRow = FoodRow(
        icon: Icon(
          FontAwesomeIcons.cookie,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        carbs: '${settings.snackCarbs}');
    FoodRow drinkRow = FoodRow(
        icon: Icon(
          FontAwesomeIcons.mugHot,
          color: Theme.of(context).primaryColor,
          size: 45,
        ),
        carbs: '${settings.drinkCarbs}');
    return Scaffold(
      appBar: PlainAppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: SingleChildScrollView(
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
                        child: FittedBox(
                          child: Text(
                            "SAVE & EXIT",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (mealRow.carbController.text.length > 0) {
                            settings.setMealSettings(
                                int.parse(mealRow.carbController.text),
                                Provider.of<Auth>(context, listen: false)
                                    .token);
                          }
                          if (snackRow.carbController.text.length > 0) {
                            settings.setSnackSettings(
                                int.parse(snackRow.carbController.text),
                                Provider.of<Auth>(context, listen: false)
                                    .token);
                          }
                          if (drinkRow.carbController.text.length > 0) {
                            settings.setDrinkSettings(
                                int.parse(drinkRow.carbController.text),
                                Provider.of<Auth>(context, listen: false)
                                    .token);
                          }
                          if (exerciseRow.exerciseController.text.length > 0) {
                            settings.setExerciseTime(
                                int.parse(exerciseRow.exerciseController.text),
                                Provider.of<Auth>(context, listen: false)
                                    .token);
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
          child: Text(
            "CANCEL",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
