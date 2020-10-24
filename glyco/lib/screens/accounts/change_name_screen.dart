import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../models/http_exception.dart';
import '../../widgets/appBars/plain_app_bar_back.dart';

//Widgets

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlainAppBarBack(),
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                "Change name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 30),
              ChangeNameForm(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeNameForm extends StatefulWidget {
  @override
  ChangeNameFormState createState() {
    return ChangeNameFormState();
  }
}

class ChangeNameFormState extends State<ChangeNameForm> {
  final _formKey = GlobalKey<FormState>();
  var enteredEmail;
  var newFirstName;
  var newLastName;
  var createdMessage = "";
  @override
  Widget build(BuildContext context) {
    Future<void> _submit() async {
      String name = newFirstName.trim() + " " + newLastName.trim();
      try {
        await Provider.of<Auth>(context, listen: false)
            //.changeProfile('displayName', name);
            .changeName(newFirstName, newLastName);
        setState(() => createdMessage = "Name changed successfully!");
      } on HttpException catch (error) {
        var errorMessage = error.toString();
        setState(() => createdMessage = errorMessage);
      } catch (error) {
        print(error);
        const errorMessage = 'Could not authenticate. Try again later';
        setState(() => createdMessage = errorMessage);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: formDecorator("enter first name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your first name";
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    this.newFirstName = value;
                  },
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                child: TextFormField(
                  decoration: formDecorator("enter last name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    this.newLastName = value;
                  },
                ),
              ),
            ],
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
                    "CHANGE NAME",
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
