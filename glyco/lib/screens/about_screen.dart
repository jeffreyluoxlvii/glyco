import 'dart:ui';

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ABOUT US',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TEAM
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('TEAM', style: Theme.of(context).textTheme.headline2),
            ),
            Text('Jeffrey Luo', style: Theme.of(context).textTheme.bodyText1),
            Text('Justin Wu', style: Theme.of(context).textTheme.bodyText1),
            Text('Herleen Kaur', style: Theme.of(context).textTheme.bodyText1),
            Text('Nathaniel Hartley',
                style: Theme.of(context).textTheme.bodyText1),

            // CLIENT
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  Text('CLIENT', style: Theme.of(context).textTheme.headline2),
            ),
            Text('Ankit Jajoo', style: Theme.of(context).textTheme.bodyText1),
            // SUPPORTERS
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('SUPPORTERS',
                  style: Theme.of(context).textTheme.headline2),
            ),
            Text('Jonathan Velez Rivera',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
