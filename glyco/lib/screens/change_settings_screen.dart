import 'package:flutter/material.dart';
import '../screens/edits/edit_shortcuts_screen.dart';
import '../screens/edits/edit_profile_screen.dart';
import '../providers/options.dart';
import 'package:provider/provider.dart';

//Widgets

import '../widgets/appBars/plain_app_bar_back.dart';
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
      appBar: PlainAppBarBack(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfile())).then((value) {
                    setState(() {
                      // refresh state of Page1
                    });
                  });
                },
                child: new Text(
                  "Click to Edit Profile",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              CurrentProfile(),
              SizedBox(height: 25),
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
              SizedBox(height: 10),
              ChangeNotifierProvider.value(
                value: settings,
                child: ShortcutsSummary(),
              ),
              SizedBox(height: 25),
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

class CurrentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: TextFormField(
                      enableInteractiveSelection: false,
                      focusNode: new AlwaysDisabledFocusNode(),
                      decoration: formDecorator("First Name"),
                      initialValue: "Jessica",
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
                      enableInteractiveSelection: false,
                      focusNode: new AlwaysDisabledFocusNode(),
                      decoration: formDecorator("Last Name"),
                      initialValue: "Woodard",
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
              enableInteractiveSelection: false,
              focusNode: new AlwaysDisabledFocusNode(),
              decoration: formDecorator("Email"),
              initialValue: "jess.woodard@gmail.com",
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your email";
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
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
