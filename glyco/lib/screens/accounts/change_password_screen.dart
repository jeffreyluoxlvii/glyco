import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../models/http_exception.dart';

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
              SizedBox(height: 15),
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
  var newPassword;
  var createdMessage = "";
  @override
  Widget build(BuildContext context) {
    Future<void> _submit() async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .changePassword(this.newPassword);
        setState(() => createdMessage = "Password changed successfully!");
        //Navigator.pushReplacementNamed(context, '/NavScreen');
      } on HttpException catch (error) {
        //var errorMessage = 'Authentication failed';
        var errorMessage =
            error.toString();
        setState(() => createdMessage = errorMessage);
      } catch (error) {
        print("Error");
        const errorMessage = 'Could not authenticate. Try again later';
        setState(() => createdMessage = errorMessage);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            obscureText: true,
            decoration: formDecorator("enter new password"),
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter a new password";
              } else {
                enteredPassword = value;
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: formDecorator("re-enter new password"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please re-enter your new password';
              } else if (value != enteredPassword) {
                return "Passwords don't match";
              }
              return null;
            },
            onSaved: (String value) {
              this.newPassword = value;
            },
          ),
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
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _submit();
                    }
                  },
                ),
              ),
            ),
            Spacer(),
          ]),
          SizedBox(height: 30),
          Text(
            createdMessage,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
          // passwordChanged
          //     ? Text(
          //         "Password changed successfully!",
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
