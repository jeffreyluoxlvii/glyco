import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/appBars/plain_app_bar_back.dart';
import '../../providers/auth.dart';
import '../../models/http_exception.dart';

//Widgets

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatelessWidget {
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
              SizedBox(height: 60),
              Text(
                "Forgot password?",
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
  var createdMessage = "";
  var email;
  @override
  Widget build(BuildContext context) {
    Future<void> _submit() async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .resetPassword(this.email);
        setState(() => createdMessage = "Please check your email for instructions!");
      } on HttpException catch (error) {
        var errorMessage = 'Authentication failed';
        errorMessage =
            'Invalid login credentials. Please make sure your email or password is correct!';
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
            decoration: formDecorator("email"),
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
            onSaved: (String value) {
              this.email = value;
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
                    "SEND INSTRUCTIONS",
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
