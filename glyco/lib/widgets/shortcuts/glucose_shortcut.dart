import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/measurement.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlucoseShortcut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context, listen: false);
    return Container(
      child: GestureDetector(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              FontAwesomeIcons.heartbeat,
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
          ),
          onTap: () {},
          onLongPress: () {},
        ),
      ),
    );
  }
}
