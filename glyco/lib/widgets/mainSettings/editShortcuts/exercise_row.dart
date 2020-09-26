import 'package:flutter/material.dart';

class ExerciseRow extends StatelessWidget {
  final Icon icon;
  final String minutes;
  final exerciseController = TextEditingController();

  ExerciseRow({
    @required this.icon,
    @required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: 250,
          child: TextField(
            controller: exerciseController,
            decoration: InputDecoration(
              hintText: minutes,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0), child: Text('minutes')),
      ],
    );
  }
}
