import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ChangeSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Glyco")),
      body: changeSettings(context),
    );
  }

  Container changeSettings(context) {
    return Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                cancel(context),
                Spacer(),
                saveAndExit(context),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(height: 15),
            Row(children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  print("Change password");
                },
                child: new Text(
                  "Change Password",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ]),
            GestureDetector(
              onTap: () {
                print("Edit Shortcuts");
              },
              child: new Text(
                "Click to Edit Shortcuts",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                print("Edit Integrations");
              },
              child: new Text(
                "Click to Edit Integrations",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ));
  }

  ClipRRect saveAndExit(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 150,
        height: 40,
        color: Colors.blue[300],
        child: FlatButton(
          child: Text("SAVE & EXIT",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            print("Save and Exit");
          },
        ),
      ),
    );
  }

  ClipRRect cancel(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 150,
        height: 40,
        color: Colors.grey,
        child: FlatButton(
          child: Text("CANCEL",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            print("Cancel");
          },
        ),
      ),
    );
  }
}
