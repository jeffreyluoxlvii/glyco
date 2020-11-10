import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glyco/providers/measurement.dart';
import 'package:glyco/widgets/exercise_manual_form.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Widget to display the exercise tile in the measurement grid.
// @author Jeffrey Luo
class ExerciseTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        margin: EdgeInsets.all(5),
        width: 190,
        height: 75,
        color: Theme.of(context).accentColor,
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.running, size: 35, color: Colors.white),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Container(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            measurement.exerciseTime.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            " min",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Last update ${DateFormat('K:mm a').format(measurement.lastUpdate)}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: ChangeNotifierProvider.value(
                      child: ExerciseManualForm(),
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
