import 'package:flutter/material.dart';
import 'package:glyco/widgets/drink_shortcut.dart';
import 'package:glyco/widgets/exercise_shortcut.dart';
import 'package:glyco/widgets/glucose_shortcut.dart';
import 'package:glyco/widgets/snack_shortcut.dart';
import '../providers/measurements.dart';
import 'package:provider/provider.dart';
import '../widgets/measurement_grid.dart';
import '../widgets/meal_shortcut.dart';

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
      ],
    );
  }
}
