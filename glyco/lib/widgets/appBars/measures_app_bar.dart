import 'package:flutter/material.dart';

class MeasuresAppBar extends StatefulWidget implements PreferredSizeWidget {
  MeasuresAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MeasuresAppBarState createState() => _MeasuresAppBarState();
}

class _MeasuresAppBarState extends State<MeasuresAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "September 6th",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.date_range,
            color: Colors.black,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
