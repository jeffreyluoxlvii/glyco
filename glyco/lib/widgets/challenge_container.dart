import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/challenges.dart';

class ChallengeContainer extends StatefulWidget {
  @override
  _ChallengeContainerState createState() => _ChallengeContainerState();
}

class _ChallengeContainerState extends State<ChallengeContainer> {
  DateTime _dateTime;
  var _isLoading = false;

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

    return Center(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Flexible(
                child: Text(
                    measurementsData.generateChallenge(selectedMeasurement),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    )),
              ),
              measurementsData.getProgressAsset(),
            ])),
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
