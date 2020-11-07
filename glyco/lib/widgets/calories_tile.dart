import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glyco/widgets/nutrition_manual_form.dart';
import 'package:provider/provider.dart';
import '../providers/measurement.dart';
import '../widgets/nutrition_form.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaloriesTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        margin: EdgeInsets.all(5),
        width: 180,
        height: 140,
        color: Theme.of(context).accentColor,
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "NUTRITION",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Icon(
                      FontAwesomeIcons.hamburger,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            measurement.calories.toString(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              " kcal",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            measurement.carbs.toString(),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            " g carbs",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: ChangeNotifierProvider.value(
                      child: NutritionManualForm(),
                      value: measurement,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
