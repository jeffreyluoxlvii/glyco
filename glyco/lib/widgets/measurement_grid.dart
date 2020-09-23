import 'package:flutter/material.dart';
import '../providers/measurement.dart';
import 'package:provider/provider.dart';
import './big_tile.dart';
import './small_tile.dart';
import './long_tile.dart';

class MeasurementGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigTile(
              title: "GLUCOSE LEVELS",
              icon: Icon(
                Icons.whatshot,
                size: 75,
                color: Colors.white,
              ),
              data: measurement.avgGlucoseLevel.toString(),
              unit: "mg/dL",
              updateTime: DateTime.now(),
            ),
            Column(
              children: [
                LongTile(
                  data: measurement.steps.toString(),
                  unit: "steps",
                  icon: Icon(
                    Icons.accessible_forward,
                    size: 35,
                    color: Colors.white,
                  ),
                  updateTime: DateTime.now(),
                ),
                LongTile(
                  data: measurement.exerciseTime.toString(),
                  unit: "min",
                  icon: Icon(
                    Icons.directions_run,
                    size: 35,
                    color: Colors.white,
                  ),
                  updateTime: DateTime.now(),
                ),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SmallTile(
                    icon: Icon(
                      Icons.fastfood,
                      color: Colors.white,
                    ),
                    data: "500",
                    unit: "kcal",
                    number: measurement.numMeals,
                    type: "meal"),
                SmallTile(
                    icon: Icon(
                      Icons.fastfood,
                      color: Colors.white,
                    ),
                    data: "500",
                    unit: "kcal",
                    number: measurement.numSnacks,
                    type: "snack"),
                SmallTile(
                    icon: Icon(
                      Icons.fastfood,
                      color: Colors.white,
                    ),
                    data: "500",
                    unit: "kcal",
                    number: measurement.numDrinks,
                    type: "drink"),
              ],
            ),
            BigTile(
              title: "A1C Levels",
              icon: Icon(
                Icons.timeline,
                size: 75,
                color: Colors.white,
              ),
              data: measurement.a1cLevel.toString(),
              unit: "mmol/L",
              updateTime: DateTime.now(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_downward,
                size: 40,
              ),
            ),
            Text(
              "View Analytics",
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
