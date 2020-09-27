import 'package:flutter/material.dart';

class ProgressContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0),
                  child: Row(children: [
                    Flexible(
                      child: Text(
                          'Your glucose level today has averaged 20% less than usual!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          )),
                    ),
                    Image.asset(
                      'assets/images/progress_glucose.jpg',
                    ),
                  ])),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                child: Row(children: [
                  Image.asset(
                    'assets/images/progress_glucosechart.jpg',
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                child: Row(children: [
                  Flexible(
                    child: Text('You have walked 55% of your goal!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        )),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                child: Row(children: [
                  Image.asset(
                    'assets/images/progress_steps.jpg',
                  ),
                ]),
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
    );
  }
}
