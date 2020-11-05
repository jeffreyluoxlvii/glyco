import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../models/http_exception.dart';
import '../../widgets/appBars/plain_app_bar_back.dart';

//Widgets

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(
              "Change Password",
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
            .changeProfile('password', this.newPassword);
        setState(() => createdMessage = "Password changed successfully!");
      } on HttpException catch (error) {
        var errorMessage = error.toString();
        if (error.toString().contains('WEAK_PASSWORD')) {
          errorMessage = 'Password should have at least 6 characters.';
        }
        setState(() => createdMessage = errorMessage);
      } catch (error) {
        print("There's an error");
        const errorMessage = 'Could not authenticate. Try again later.';
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
