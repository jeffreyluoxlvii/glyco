import 'package:flutter/material.dart';
import '../widgets/long_tile.dart';
import '../widgets/big_tile.dart';

class MeasuresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            "Shortcuts",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.healing),
                onPressed: null,
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(Icons.donut_small),
                onPressed: null,
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(Icons.fastfood),
                onPressed: null,
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(Icons.local_car_wash),
                onPressed: null,
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(Icons.directions_run),
                onPressed: null,
                iconSize: 50,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        Divider(
          thickness: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigTile(
              title: "GLUCOSE LEVELS",
              icon: Icon(
                Icons.whatshot,
                size: 75,
              ),
              data: "122",
              unit: "mg/dL",
              updateTime: "Last update 23 min",
            ),
            Column(
              children: [
                LongTile(
                  data: "10,835",
                  unit: "steps",
                  icon: Icon(
                    Icons.accessible_forward,
                    size: 35,
                  ),
                  updateTime: "Last update 2 hr",
                ),
                LongTile(
                  data: "50",
                  unit: "min",
                  icon: Icon(
                    Icons.directions_run,
                    size: 35,
                  ),
                  updateTime: "Last update 2 hr",
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
