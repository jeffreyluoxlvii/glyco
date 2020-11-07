import 'package:flutter/material.dart';
import 'package:glyco/widgets/nutrition_form.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/measurements.dart';
import '../providers/options.dart';
import '../providers/measurement.dart';
import '../providers/auth.dart';

import '../widgets/measurement_grid.dart';
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
        .then(
            (_) => Provider.of<Options>(context, listen: false).fetchSettings())
        .then((_) {
      setState(() {
        _isLoading = false;
        selectedMeasurement = Provider.of<Measurements>(context, listen: false)
            .findByDate(_dateTime);
      });
    });
    super.initState();
  }

  Future<void> refresh() async {
    await Provider.of<Measurements>(context, listen: false)
        .fetchAndSetMeasurements();
    setState(() {
      _isLoading = false;
      selectedMeasurement = Provider.of<Measurements>(context, listen: false)
          .findByDate(_dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final measurementsData = Provider.of<Measurements>(context);
    final settings = Provider.of<Options>(context).settings;
    final authData = Provider.of<Auth>(context, listen: false);
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
          : selectedMeasurement == null
              ? RefreshIndicator(
                  child: Container(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        width: double.infinity,
                        height: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Adding this day to the database.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Scroll down to refresh",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onRefresh: () => refresh(),
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
                                Shortcut(
                                  FontAwesomeIcons.hamburger,
                                  () {
                                    selectedMeasurement.addNutrition(
                                      settings.mealCarbs,
                                      authData.token,
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
                                              settings.mealCarbs * -1,
                                              authData.token,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  NutritionForm(FontAwesomeIcons.hamburger),
                                  "MEAL",
                                ),
                                Shortcut(
                                  FontAwesomeIcons.cookie,
                                  () {
                                    selectedMeasurement.addNutrition(
                                      settings.snackCarbs,
                                      authData.token,
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
                                              settings.snackCarbs * -1,
                                              authData.token,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  NutritionForm(FontAwesomeIcons.cookie),
                                  "SNACK",
                                ),
                                Shortcut(
                                  FontAwesomeIcons.mugHot,
                                  () {
                                    selectedMeasurement.addNutrition(
                                      settings.drinkCarbs,
                                      authData.token,
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
                                              settings.drinkCarbs * -1,
                                              authData.token,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  NutritionForm(FontAwesomeIcons.mugHot),
                                  "DRINK",
                                ),
                                Shortcut(
                                  FontAwesomeIcons.running,
                                  () {
                                    selectedMeasurement.addExercise(
                                      settings.exerciseTime,
                                      authData.token,
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
                                              authData.token,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  ExerciseForm(),
                                  "EXERCISE",
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
