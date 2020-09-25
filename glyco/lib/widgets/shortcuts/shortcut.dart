import 'package:flutter/material.dart';
import 'package:glyco/widgets/nutrition_form.dart';

class Shortcut extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  Shortcut(this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
          ),
          onTap: onTap,
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: NutritionForm(),
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
