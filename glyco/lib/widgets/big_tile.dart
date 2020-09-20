import 'package:flutter/material.dart';

class BigTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final String data;
  final String unit;
  final String updateTime;

  const BigTile({
    @required this.title,
    @required this.icon,
    @required this.data,
    @required this.unit,
    @required this.updateTime,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.0),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        width: 160,
        height: 160,
        color: Colors.pink,
        child: FlatButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12),
              ),
              icon,
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    data,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " " + unit,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Text(
                'Last update 23 min',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
