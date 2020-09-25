import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/measurements.dart';

import '../widgets/measurement_grid.dart';
import '../widgets/shortcuts/meal_shortcut.dart';
import '../widgets/shortcuts/glucose_shortcut.dart';
import '../widgets/shortcuts/snack_shortcut.dart';
import '../widgets/shortcuts/drink_shortcut.dart';
import '../widgets/shortcuts/exercise_shortcut.dart';

class MeasuresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: make it so that the measurement depends on the day
    final measurementsData = Provider.of<Measurements>(context);
    final selectedMeasurement = measurementsData.latestMeasurement;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
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
                MealShortcut(),
                SnackShortcut(),
                DrinkShortcut(),
                ExerciseShortcut(),
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
    );
  }
}
