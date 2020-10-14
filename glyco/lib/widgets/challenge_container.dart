import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/challenges.dart';

class ChallengeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurementsData = Provider.of<Challenges>(context);

    return Center(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Flexible(
                child: Text(measurementsData.generateChallenge(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    )),
              ),
              Image.asset(
                'assets/images/challenges_image1.jpg',
              ),
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
