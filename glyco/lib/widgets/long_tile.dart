import 'package:flutter/material.dart';

class LongTile extends StatelessWidget {
  final Icon icon;
  final String data;
  final String unit;
  // TODO: convert to DateTime
  final String updateTime;

  const LongTile({
    @required this.icon,
    @required this.data,
    @required this.unit,
    @required this.updateTime,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        margin: EdgeInsets.all(5),
        width: 200,
        height: 75,
        color: Colors.lightBlue,
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Container(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          data,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " " + unit,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      updateTime,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
