import 'package:flutter/material.dart';

class ChallengeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Flexible(
                child: Text(
                    'Your mg/dL levels this week have been 40% lower than the rest of the month. Let’s keep it less than 135!',
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
