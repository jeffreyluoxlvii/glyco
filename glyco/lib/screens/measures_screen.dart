import 'package:flutter/material.dart';
import '../widgets/long_tile.dart';
import '../widgets/big_tile.dart';
import '../widgets/small_tile.dart';

class MeasuresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.healing,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(
                  Icons.donut_small,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(
                  Icons.fastfood,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(
                  Icons.local_car_wash,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(
                  Icons.directions_run,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
                iconSize: 50,
              ),
            ],
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
                    color: Colors.white,
                  ),
                  updateTime: "Last update 2 hr",
                ),
                LongTile(
                  data: "50",
                  unit: "min",
                  icon: Icon(
                    Icons.directions_run,
                    size: 35,
                    color: Colors.white,
                  ),
                  updateTime: "Last update 2 hr",
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
                    number: "1",
                    type: "meal"),
                SmallTile(
                    icon: Icon(
                      Icons.fastfood,
                      color: Colors.white,
                    ),
                    data: "500",
                    unit: "kcal",
                    number: "1",
                    type: "meal"),
                SmallTile(
                    icon: Icon(
                      Icons.fastfood,
                      color: Colors.white,
                    ),
                    data: "500",
                    unit: "kcal",
                    number: "1",
                    type: "meal"),
              ],
            ),
            BigTile(
              title: "A1C Levels",
              icon: Icon(
                Icons.timeline,
                size: 75,
                color: Colors.white,
              ),
              data: "11.4",
              unit: "mmol/L",
              updateTime: "last update 23 min",
            )
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
