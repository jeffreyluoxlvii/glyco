import 'package:flutter/material.dart';

//Widgets

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Glyco",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                "Change password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 30),
              ChangePassForm(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePassForm extends StatefulWidget {
  @override
  ChangePassFormState createState() {
    return ChangePassFormState();
  }
}

class ChangePassFormState extends State<ChangePassForm> {
  final _formKey = GlobalKey<FormState>();
  var enteredPassword;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
              decoration: formDecorator("enter old password"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              }),
          TextFormField(
              obscureText: true,
              decoration: formDecorator("enter new password"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter a password";
                } else {
                  enteredPassword = value;
                }
                return null;
              }),
          TextFormField(
              obscureText: true,
              decoration: formDecorator("re-enter new password"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                } else if (value != enteredPassword) {
                  return "Passwords don't match";
                }
                return null;
              }),
          SizedBox(height: 30),
          Row(children: [
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                padding: EdgeInsets.all(5),
                width: 300,
                height: 40,
                color: Colors.cyanAccent[400],
                child: FlatButton(
                  child: Text(
                    "CHANGE PASSWORD",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {
                    //   setState(() => accountCreated = true);
                    // }
                  },
                ),
              ),
            ),
            Spacer(),
          ]),
          SizedBox(height: 30),
          // accountCreated
          //     ? Text(
          //         "Account created, please verify your email!",
          //         style: TextStyle(
          //           fontSize: 18,
          //           color: Theme.of(context).primaryColor,
          //         ),
          //       )
          //     : Text(""),
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
