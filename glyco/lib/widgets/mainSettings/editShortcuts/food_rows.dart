import 'package:flutter/material.dart';

class FoodRow extends StatelessWidget {
  final Icon icon;
  final String carbs;
  final carbController = TextEditingController();

  FoodRow({
    @required this.icon,
    @required this.carbs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        //Spacer(),
        SizedBox(width: 30),
        Expanded(
          child: TextField(
            controller: carbController,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink),
              ),
              hintText: carbs,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text('g carbs'),
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
