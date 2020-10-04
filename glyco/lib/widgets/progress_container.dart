import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProgressContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Icon(
              FontAwesomeIcons.heartbeat,
              size: 30,
                color: Theme.of(context).primaryColor,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                    'Your glucose levels today have averaged 20% less than usual!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              ),
              Image.asset(
                'assets/images/progress_glucose.jpg',
              ),
            ]
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/progress_glucosechart.jpg',
              ),
            ],
          ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //       horizontal: 16.0, vertical: 14.0),
        //   child: Row(children: [
        //     Flexible(
        //       child: Text('You have walked 55% of your goal!',
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 14,
        //           )),
        //     ),
        //   ]),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //       horizontal: 16.0, vertical: 14.0),
        //   child: Row(children: [
        //     Image.asset(
        //       'assets/images/progress_steps.jpg',
        //     ),
        //   ]),
        // ),
      
        ],
      ),
    );
  }
}