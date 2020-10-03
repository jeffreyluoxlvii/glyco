import 'package:flutter/material.dart';
import 'package:glyco/screens/edit_shortcuts_screen.dart';
import '../providers/options.dart';
import 'package:provider/provider.dart';

//Widgets

import '../widgets/shortcuts/shortcuts_summary.dart';

class ChangeSettingsScreen extends StatefulWidget {
  @override
  _ChangeSettingsScreenState createState() => _ChangeSettingsScreenState();
}

class _ChangeSettingsScreenState extends State<ChangeSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Options>(context).settings;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Glyco",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChangeSettingsForm(),
              SizedBox(height: 15),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ChangePassword');
                    },
                    child: new Text(
                      "Change Password",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditShortcuts())).then((value) {
                    setState(() {
                      // refresh state of Page1
                    });
                  });
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
              SizedBox(height: 15),
              ChangeNotifierProvider.value(
                value: settings,
                child: ShortcutsSummary(),
              ),
              SizedBox(height: 15),
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
          ),
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
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              CancelButton(),
              Spacer(),
              SaveAndExitButton(),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: TextFormField(
                      decoration: formDecorator("First Name"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: TextFormField(
                      decoration: formDecorator("Last Name"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      }),
                ),
              ),
            ],
          ),
          TextFormField(
              decoration: formDecorator("Email"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              }),
          TextFormField(
              obscureText: true,
              decoration: formDecorator("Password"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter a password";
                } else {
                  enteredPassword = value;
                }
                return null;
              }),
        ],
      ),
    );
  }
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
          child: Text("CANCEL",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SaveAndExitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 150,
        height: 40,
        color: Colors.cyanAccent[400],
        child: FlatButton(
          child: FittedBox(
            child: Text("SAVE & EXIT",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
