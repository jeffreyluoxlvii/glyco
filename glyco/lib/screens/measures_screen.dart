import 'package:flutter/material.dart';
import 'package:glyco/widgets/nutrition_form.dart';
import '../widgets/exercise_form.dart';
import 'package:provider/provider.dart';
import '../providers/measurements.dart';
import '../providers/options.dart';

import '../widgets/measurement_grid.dart';
import '../widgets/shortcuts/glucose_shortcut.dart';
import '../widgets/shortcuts/shortcut.dart';

class MeasuresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: make it so that the measurement depends on the day
    final measurementsData = Provider.of<Measurements>(context);
    final selectedMeasurement = measurementsData.latestMeasurement;
    final settings = Provider.of<Options>(context).settings;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            child: Text(
              "Shortcuts",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ChangeNotifierProvider.value(
              value: selectedMeasurement,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GlucoseShortcut(),
                  Shortcut(
                      Icons.fastfood,
                      () => selectedMeasurement.addNutrition(
                            settings.mealCalories,
                            settings.mealCarbs,
                          ),
                      NutritionForm()),
                  Shortcut(
                      Icons.donut_small,
                      () => selectedMeasurement.addNutrition(
                            settings.snackCalories,
                            settings.snackCarbs,
                          ),
                      NutritionForm()),
                  Shortcut(
                      Icons.free_breakfast,
                      () => selectedMeasurement.addNutrition(
                            settings.drinkCalories,
                            settings.drinkCarbs,
                          ),
                      NutritionForm()),
                  Shortcut(
                    Icons.directions_run,
                    () => selectedMeasurement.addExercise(
                      settings.exerciseTime,
                    ),
                    ExerciseForm(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Measurements",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ChangeNotifierProvider.value(
            child: MeasurementGrid(),
            value: selectedMeasurement,
          ),
          Row(
            children: [
              Spacer(),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "View Analytics",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
