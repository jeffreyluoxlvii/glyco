import 'package:flutter/material.dart';

class FoodRow extends StatelessWidget{
  final Icon icon;
  final String kcal;
  final String carbs;
  final kcalController = TextEditingController();
  final carbController = TextEditingController();

  FoodRow({
    @required this.icon,
    @required this.kcal,
    @required this.carbs,
  });

  @override 
  Widget build(BuildContext context){
    return Row(
              children: [
                icon,
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  width: 60,
                  child: TextField(
                    controller: kcalController,
                    decoration: InputDecoration(
                      hintText: kcal,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text('kcal')),
                Spacer(),
                Container(
                  width: 50,
                  child: TextField(
                    controller: carbController,
                    decoration: InputDecoration(
                      hintText: carbs,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text('g carbs')),
              ],
            );
  }
}