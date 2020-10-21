import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/measurements.dart';

class ChallengeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> refresh() async {
      await Provider.of<Measurements>(context, listen: false)
          .fetchAndSetMeasurements();
    }

    final challengesProvider = Provider.of<Measurements>(context);

    return Center(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Flexible(
                child: Text(challengesProvider.generateChallenge(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    )),
              ),
              challengesProvider.getProgressAsset(),
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
