import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/measurement.dart';
import '../../providers/options.dart';

class MealShortcut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context, listen: false);
    final settings = Provider.of<Options>(context).settings;
    return Container(
      child: GestureDetector(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.fastfood,
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
          ),
          onTap: () {
            measurement.addMeal(
              settings.mealCalories,
              settings.mealCarbs,
            );
          },
          onLongPress: () {},
        ),
      ),
    );
  }
}
