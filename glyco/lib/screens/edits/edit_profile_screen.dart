import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../screens/accounts/change_email_screen.dart';
import '../../screens/accounts/change_name_screen.dart';

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeName())).then((value) {
                    setState(() {
                      // refresh state of Page1
                    });
                  });
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeEmail())).then((value) {
                    setState(() {
                      // refresh state of Page1
                    });
                  });
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
