import 'package:flutter/material.dart';
import 'package:glyco/screens/view_analytics.dart';
import 'package:provider/provider.dart';
import 'package:glyco/widgets/appBars/challenges_app_bar.dart';
import '../widgets/challenge_container.dart';
import '../widgets/progress_container.dart';
import '../providers/auth.dart';

// @author Herleen Kaur

class ChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set first name of user so we can address them with "Good day, ___!"
    var nameList =
        Provider.of<Auth>(context, listen: false).userName.split(" ");
    var firstName = nameList[0];

    return Scaffold(
      body: Scaffold(
        appBar: ChallengesAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                child: Text(
                  "Good day, " + firstName + "!",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Here are today's goals:",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[300],
                  ),
                ),
              ),

              // Container that holds Challenges widget generated for users
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ChallengeContainer(),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "Your progress:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.pink[300],
                      ),
                    ),
                  ),
                   Row(
                    children: [
                      FlatButton(
                        padding: const EdgeInsets.only(top: 5.0, right: 16.0),
                        color: Colors.transparent,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ViewAnalyticsScreen()));
                        },
                        child: Text(
                          "Or View Monthly Data",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[500]
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
              ),

              // Container that holds Progress widget. Displays progress towards generated challenges
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Center(
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: ProgressContainer(),
                          ),
                        ]),
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
