import 'package:flutter/material.dart';

//Widgets

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccount extends StatelessWidget {
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
                "Welcome to Glyco",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Let's get started!",
                style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 30),
              InfoForm(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoForm extends StatefulWidget {
  @override
  InfoFormState createState() {
    return InfoFormState();
  }
}

class InfoFormState extends State<InfoForm> {
  final _formKey = GlobalKey<FormState>();
  var enteredPassword;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
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
          TextFormField(
              obscureText: true,
              decoration: formDecorator("Re-enter Password"),
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
                    "CREATE AN ACCOUNT",
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
