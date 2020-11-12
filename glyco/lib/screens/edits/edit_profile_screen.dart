import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../screens/accounts/change_email_screen.dart';
import '../../screens/accounts/change_name_screen.dart';
import '../../screens/accounts/change_password_screen.dart';

//Author: Justin Wu

//This class creates the widgets that are shown when a user wants to edit their profile.
//It shows all of the information that they can change, such as name, email, and password.
class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Click to edit",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
          ChangeSettingsForm(),
          SizedBox(height: 30),
        ],
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

    Row profileRow(label, content) {
      return Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Text(
            content,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                child: profileRow("Name ", firstName + " " + lastName),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: ChangeName(),
                        ),
                      );
                    },
                  );
                },
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
                child: profileRow("Email ",
                    Provider.of<Auth>(context, listen: false).userEmail),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: ChangeEmail(),
                        ),
                      );
                    },
                  );
                },
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
                child: profileRow("Change Password", ""),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: ChangePassword(),
                        ),
                      );
                    },
                  );
                  //Navigator.pushNamed(context, '/ChangePassword');
                },
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
