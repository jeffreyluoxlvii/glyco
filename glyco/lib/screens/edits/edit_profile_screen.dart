import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';

//Widgets

import '../../widgets/appBars/plain_app_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlainAppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text("Edit Profile",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                )),
            SizedBox(height: 30),
            ChangeSettingsForm(),
            SizedBox(height: 30),
            Row(
              children: [
                CancelButton(),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 150,
                    height: 40,
                    color: Colors.cyanAccent[400],
                    child: FlatButton(
                      child: FittedBox(
                        child: Text(
                          "SAVE & EXIT",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeSettingsForm extends StatefulWidget {
  @override
  ChangeSettingsFormState createState() {
    return ChangeSettingsFormState();
  }
}

class ChangeSettingsFormState extends State<ChangeSettingsForm> {
  final _formKey = GlobalKey<FormState>();
  var enteredPassword;
  bool accountCreated = false;
  @override
  Widget build(BuildContext context) {
    var nameList =
        Provider.of<Auth>(context, listen: false).userName.split(" ");
    var firstName = nameList[0];
    var lastName = nameList[1];
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/ChangeName');
                },
                child: new Row(
                  children: [
                    Text(
                      "Name ",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      firstName + " " + lastName,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.pink,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/ChangeEmail');
                },
                child: new Row(
                  children: [
                    Text(
                      "Email  ",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(Provider.of<Auth>(context, listen: false).userEmail,
                        style: TextStyle(
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.pink,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/ChangePassword');
                },
                child: new Row(
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.pink,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration formDecorator(String label) {
  return InputDecoration(
    labelText: label,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
    ),
  );
}

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 150,
        height: 40,
        color: Colors.grey[400],
        child: FlatButton(
          child: Text(
            "CANCEL",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
