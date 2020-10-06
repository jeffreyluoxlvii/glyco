import 'package:flutter/material.dart';
import 'package:glyco/widgets/nutrition_form.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/measurements.dart';
import '../providers/options.dart';
import '../providers/measurement.dart';

import '../widgets/measurement_grid.dart';
import '../widgets/shortcuts/glucose_shortcut.dart';
import '../widgets/shortcuts/shortcut.dart';
import '../widgets/exercise_form.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeasuresScreen extends StatefulWidget {
  @override
  _MeasuresScreenState createState() => _MeasuresScreenState();
}

class _MeasuresScreenState extends State<MeasuresScreen> {
  DateTime _dateTime;
  var _isLoading = false;
  Measurement selectedMeasurement;

  @override
  void initState() {
    setState(() {
      _dateTime = DateTime.now();
      _isLoading = true;
    });

    Provider.of<Measurements>(context, listen: false)
        .fetchAndSetMeasurements()
        .then((_) {
      setState(() {
        _isLoading = false;
        selectedMeasurement = Provider.of<Measurements>(context, listen: false)
            .findByDate(_dateTime);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final measurementsData = Provider.of<Measurements>(context);
    final settings = Provider.of<Options>(context).settings;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('EEE, MMM d, ' 'yyyy').format(_dateTime),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.calendar,
              color: Colors.black,
            ),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime(2010),
                lastDate: DateTime.now(),
              ).then((date) {
                if (date != null) {
                  setState(() {
                    _dateTime = date;
                    selectedMeasurement =
                        Provider.of<Measurements>(context, listen: false)
                            .findByDate(_dateTime);
                  });
                }
              });
            },
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                              () {
                                selectedMeasurement.addNutrition(
                                  settings.mealCalories,
                                  settings.mealCarbs,
                                );
                                Scaffold.of(context).hideCurrentSnackBar();
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added meal!'),
                                    duration: Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: 'UNDO',
                                      onPressed: () {
                                        selectedMeasurement.addNutrition(
                                          settings.mealCalories * -1,
                                          settings.mealCarbs * -1,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                              NutritionForm(FontAwesomeIcons.hamburger),
                            ),
                            Shortcut(
                              FontAwesomeIcons.cookie,
                              () {
                                selectedMeasurement.addNutrition(
                                  settings.snackCalories,
                                  settings.snackCarbs,
                                );
                                Scaffold.of(context).hideCurrentSnackBar();
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added snack!'),
                                    duration: Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: 'UNDO',
                                      onPressed: () {
                                        selectedMeasurement.addNutrition(
                                          settings.snackCalories * -1,
                                          settings.snackCarbs * -1,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                              NutritionForm(FontAwesomeIcons.cookie),
                            ),
                            Shortcut(
                              FontAwesomeIcons.mugHot,
                              () {
                                selectedMeasurement.addNutrition(
                                  settings.drinkCalories,
                                  settings.drinkCarbs,
                                );
                                Scaffold.of(context).hideCurrentSnackBar();
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added drink!'),
                                    duration: Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: 'UNDO',
                                      onPressed: () {
                                        selectedMeasurement.addNutrition(
                                          settings.drinkCalories * -1,
                                          settings.drinkCarbs * -1,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                              NutritionForm(FontAwesomeIcons.mugHot),
                            ),
                            Shortcut(
                              FontAwesomeIcons.running,
                              () {
                                selectedMeasurement.addExercise(
                                  settings.exerciseTime,
                                );
                                Scaffold.of(context).hideCurrentSnackBar();
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added exercise!'),
                                    duration: Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: 'UNDO',
                                      onPressed: () {
                                        selectedMeasurement.addExercise(
                                          settings.exerciseTime * -1,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
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
