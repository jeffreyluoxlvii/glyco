import 'package:flutter/material.dart';

class GlucoseRow extends StatelessWidget {
  final Icon icon;
  final String measurement;

  const GlucoseRow({
    @required this.icon,
    @required this.measurement,
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
            decoration: InputDecoration(
              hintText: measurement,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text('mg/dL'),
        ),
      ],
    );
  }
}
