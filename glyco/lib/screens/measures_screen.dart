import 'package:flutter/material.dart';
import 'package:glyco/widgets/appBars/measures_app_bar.dart';
import 'package:glyco/widgets/nutrition_form.dart';
import '../widgets/exercise_form.dart';
import 'package:provider/provider.dart';
import '../providers/measurements.dart';
import '../providers/options.dart';

import '../widgets/measurement_grid.dart';
import '../widgets/shortcuts/glucose_shortcut.dart';
import '../widgets/shortcuts/shortcut.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeasuresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: make it so that the measurement depends on the day
    final measurementsData = Provider.of<Measurements>(context);
    final selectedMeasurement = measurementsData.latestMeasurement;
    final settings = Provider.of<Options>(context).settings;

    return Scaffold(
      appBar: MeasuresAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
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
                        FontAwesomeIcons.hamburger,
                        () => selectedMeasurement.addNutrition(
                          settings.mealCalories,
                          settings.mealCarbs,
                        ),
                        NutritionForm(FontAwesomeIcons.hamburger),
                      ),
                      Shortcut(
                        FontAwesomeIcons.cookie,
                        () => selectedMeasurement.addNutrition(
                          settings.snackCalories,
                          settings.snackCarbs,
                        ),
                        NutritionForm(FontAwesomeIcons.cookie),
                      ),
                      Shortcut(
                        FontAwesomeIcons.mugHot,
                        () => selectedMeasurement.addNutrition(
                          settings.drinkCalories,
                          settings.drinkCarbs,
                        ),
                        NutritionForm(FontAwesomeIcons.mugHot),
                      ),
                      Shortcut(
                        FontAwesomeIcons.running,
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
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "View Analytics",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
