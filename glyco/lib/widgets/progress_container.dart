import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/challenges.dart';

class ProgressContainer extends StatefulWidget {
  @override
  _ProgressContainerState createState() => _ProgressContainerState();
}

class _ProgressContainerState extends State<ProgressContainer> {
  DateTime _dateTime;
  var _isLoading = false;
  String _challengeGiven;
  int _challengeGoal;

  @override
  void initState() {
    setState(() {
      _dateTime = DateTime.now();
      _isLoading = true;
    });

    Provider.of<Challenges>(context, listen: false)
        .fetchAndSetMeasurements()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final measurementsData = Provider.of<Challenges>(context);
    final selectedMeasurement = measurementsData.findByDate(_dateTime);
    _challengeGiven = measurementsData.getChallenge();
    _challengeGoal = measurementsData.getChallengeGoal();

    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 0),
          //   child: Icon(
          //     FontAwesomeIcons.heartbeat,
          //     size: 30,
          //     color: Theme.of(context).primaryColor,
          //   ),
          // ),
          // Row(children: [
          //   Flexible(
          //     child: Text(
          //         'Your glucose levels today have averaged 20% less than usual!',
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 16,
          //         )),
          //   ),
          //   Image.asset(
          //     'assets/images/progress_glucose.jpg',
          //   ),
          // ]),
          // Row(
          //   children: [
          //     Image.asset(
          //       'assets/images/progress_glucosechart.jpg',
          //     ),
          //   ],
          // ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 14.0),
            child: Row(children: [
              Flexible(
                child: Text(
                    measurementsData.progressUpdate(selectedMeasurement, _challengeGiven, _challengeGoal),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    )),
              ),
            ]),
          ),
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          //   child: Row(children: [
          //     Image.asset(
          //       'assets/images/progress_steps.jpg',
          //     ),
          //   ]),
          // ),
        ],
      ),
    );
  }
}
