import 'package:flutter/material.dart';

//Widgets

import 'package:glyco/widgets/mainSettings/editShortcuts/glucose_row.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              Text("Welcome to Glyco",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              Text("Let's get started!",
                  style: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).primaryColor,
                  )),
              SizedBox(height: 30),
              InfoForm(),
              SizedBox(height: 30),
              Row(children: [
                Spacer(),
                CreateButton(),
                Spacer(),
              ]),
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
      child: Column(
        children: <Widget>[
          Row(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  }),
            ],
          ),
          TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              }),
          TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
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
              decoration: const InputDecoration(
                labelText: 'Re-enter Password',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                } else if (value != enteredPassword) {
                  return "Passwords don't match";
                }
                return null;
              }),
        ],
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 300,
        height: 40,
        color: Colors.cyanAccent[400],
        child: FlatButton(
          child: Text(
            "CREATE ACCOUNT",
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
