import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/measurement.dart';

class SnackShortcut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context, listen: false);
    return Container(
      child: GestureDetector(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.donut_small,
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
          ),
          onTap: () {
            measurement.addSnack(100, 5);
          },
          onLongPress: () {},
        ),
      ),
    );
  }
}
