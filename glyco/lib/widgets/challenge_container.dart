import 'package:flutter/material.dart';

class ChallengeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Your mg/dL levels this week have been 40% lower than the rest of the month. Let’s keep it less than 135!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            )
          ),
        ),
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
