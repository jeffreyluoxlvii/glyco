import 'package:flutter/material.dart';

class ChallengesAppBar extends StatefulWidget implements PreferredSizeWidget {
  ChallengesAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _ChallengesAppBarState createState() => _ChallengesAppBarState();
}

class _ChallengesAppBarState extends State<ChallengesAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text("Challenges"));
  }
}
