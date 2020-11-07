import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/measurement.dart';

class Shortcut extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final Widget form;
  final String title;

  Shortcut(this.icon, this.onTap, this.form, this.title);

  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context);
    return Container(
      child: GestureDetector(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    title,
                  ),
                ),
              ],
            ),
          ),
          onTap: onTap,
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: ChangeNotifierProvider.value(
                      child: form,
                      value: measurement,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
