import 'package:flutter/material.dart';
import 'package:glyco/widgets/appBars/challenges_app_bar.dart';

class ChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChallengesAppBar(),
      body: Text("Challenges Screen"),
    );
  }
}
