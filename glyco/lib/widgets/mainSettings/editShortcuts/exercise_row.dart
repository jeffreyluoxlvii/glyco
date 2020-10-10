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
          width: 235,
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink),
              ),
              hintText: minutes,
            ),
            //initialValue: minutes,
            controller: exerciseController,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text('minutes'),
        ),
      ],
    );
  }
}

InputDecoration formDecorator() {
  return InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
    ),
  );
}
