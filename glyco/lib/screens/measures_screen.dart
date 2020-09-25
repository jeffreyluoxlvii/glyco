import 'package:flutter/material.dart';
import '../providers/measurements.dart';
import 'package:provider/provider.dart';
import '../widgets/measurement_grid.dart';

class MeasuresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: make it so that the measurement depends on the day
    final measurementsData = Provider.of<Measurements>(context);
    final selectedMeasurement = measurementsData.latestMeasurement;

    return Container(
      width: double.infinity,
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
                  onPressed: () {
                    selectedMeasurement.addMeal(500, 15);
                  },
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
          ChangeNotifierProvider.value(
            child: MeasurementGrid(),
            value: selectedMeasurement,
          ),
        ],
      ),
    );
  }
}
