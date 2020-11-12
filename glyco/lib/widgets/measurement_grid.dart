import 'package:flutter/material.dart';
import 'package:glyco/widgets/a1c_tile.dart';
import 'package:glyco/widgets/exercise_tile.dart';
import 'package:glyco/widgets/glucose_tile.dart';
import '../widgets/calories_tile.dart';
import '../providers/measurement.dart';
import 'package:provider/provider.dart';
import './long_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget to display the measurement grid in the Measures screen.
// @author Jeffrey Luo
class MeasurementGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlucoseTile(),
            Column(
              children: [
                LongTile(
                  data: measurement.steps.toString(),
                  unit: "steps",
                  icon: Icon(
                    FontAwesomeIcons.shoePrints,
                    size: 25,
                    color: Colors.white,
                  ),
                  updateTime: measurement.lastUpdate,
                ),
                ExerciseTile(),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CaloriesTile(),
            A1CTile(),
          ],
        ),
      ],
    );
  }
}
