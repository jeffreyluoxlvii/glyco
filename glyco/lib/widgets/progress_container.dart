import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glyco/widgets/pie_progress.dart';
import '../providers/measurements.dart';
import 'package:provider/provider.dart';
import '../widgets/glucose_progress.dart';
import "../widgets/linechart_progress.dart";

class ProgressContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<Measurements>(context);

    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: GlucoseProgressContainer(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: PieProgressContainer(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: LineChartProgressContainer(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Icon(
              progressProvider.getProgressIcon(),
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14.0),
            child: Row(children: [
              Flexible(
                child: Text(progressProvider.progressUpdate(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    )),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
