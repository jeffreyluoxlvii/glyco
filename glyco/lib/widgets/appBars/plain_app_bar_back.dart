import 'package:flutter/material.dart';

class PlainAppBarBack extends StatefulWidget implements PreferredSizeWidget {
  PlainAppBarBack({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _PlainAppBarBackState createState() => _PlainAppBarBackState();
}

class _PlainAppBarBackState extends State<PlainAppBarBack> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        "Glyco",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
