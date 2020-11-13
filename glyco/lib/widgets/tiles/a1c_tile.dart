import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/measurement.dart';
import 'package:intl/intl.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget to display the A1C tile in the measurement grid.
// @author Jeffrey Luo
class A1CTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.0),
      child: Container(
        margin: EdgeInsets.all(5),
        width: 160,
        height: 160,
        color: Theme.of(context).primaryColor,
        child: FlatButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "A1C Levels",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.signal,
                      size: 60,
                      color: Colors.white,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    measurement.a1cLevel.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      ' mmol/L',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
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
      ),
    );
  }
}
