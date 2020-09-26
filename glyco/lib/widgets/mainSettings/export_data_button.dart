import 'package:flutter/material.dart';

class ExportDataButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        width: 250,
        height: 40,
        color: Colors.blue[300],
        child: FlatButton(
          child: Text(
            "EXPORT DATA",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
