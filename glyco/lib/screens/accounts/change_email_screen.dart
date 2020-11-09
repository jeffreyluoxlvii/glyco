import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../models/http_exception.dart';

//Widgets

class ChangeEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(
              "Change Email",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 30),
            ChangeEmailForm(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class ChangeEmailForm extends StatefulWidget {
  @override
  ChangeEmailFormState createState() {
    return ChangeEmailFormState();
  }
}

class ChangeEmailFormState extends State<ChangeEmailForm> {
  final _formKey = GlobalKey<FormState>();
  var enteredEmail;
  var newEmail;
  var createdMessage = "";
  @override
  Widget build(BuildContext context) {
    Future<void> _submit() async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .changeProfile('email', this.newEmail);
        setState(() => createdMessage = "Email changed successfully!");
      } on HttpException catch (error) {
        var errorMessage;
        if (error.toString().contains('EMAIL_EXISTS')) {
          errorMessage = 'This email address is already in use.';
        } else if (error.toString().contains('INVALID_EMAIL')) {
          errorMessage = 'This is not a valid email address.';
        }
        setState(() => createdMessage = errorMessage);
      } catch (error) {
        print(error);
        const errorMessage = 'Could not authenticate. Try again later.';
        setState(() => createdMessage = errorMessage);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: formDecorator("enter new email"),
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter a new email";
              } else {
                enteredEmail = value;
              }
              return null;
            },
          ),
          TextFormField(
            decoration: formDecorator("re-enter new email"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please re-enter your new email';
              } else if (value != enteredEmail) {
                return "Emails don't match";
              }
              return null;
            },
            onSaved: (String value) {
              this.newEmail = value;
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
                    "CHANGE EMAIL",
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
