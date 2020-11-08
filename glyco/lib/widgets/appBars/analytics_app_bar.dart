import 'package:flutter/material.dart';

class AnalyticsAppBar extends StatefulWidget implements PreferredSizeWidget {
  AnalyticsAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _AnalyticsAppBarState createState() => _AnalyticsAppBarState();
}

class _AnalyticsAppBarState extends State<AnalyticsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Analytics",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ));
  }
}
