import 'package:flutter/material.dart';

class PlainAppBar extends StatefulWidget implements PreferredSizeWidget {
  PlainAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _PlainAppBarState createState() => _PlainAppBarState();
}

class _PlainAppBarState extends State<PlainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Glyco",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
