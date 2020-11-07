import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/appBars/plain_app_bar.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import 'package:nano_healthkit_plugin/nano_healthkit_plugin.dart';
import 'package:nano_healthkit_plugin/healthdata.pb.dart';
import 'package:nano_healthkit_plugin/healthdata.pbenum.dart';
import '../providers/healthkit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlainAppBar(),
      body: loginScreen(context),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget loginScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Image.asset(
              'assets/images/glyco_vector.png',
              height: 250,
              width: 250,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: SignInForm(),
          ),
          createAccount(context),
        ],
      ),
    );
  }

  GestureDetector createAccount(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HealthKit().authorize();
        Navigator.pushNamed(context, '/CreateAccount');
      },
      child: new Text(
        "or Create an Account",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  var createdMessage = "";
  @override
  Widget build(BuildContext context) {
    Future<void> _submit() async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .signIn(this.email, this.password);
        setState(() => createdMessage = "");
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
          TextFormField(
            obscureText: true,
            decoration: formDecorator("password"),
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter a password";
              }
              return null;
            },
            onSaved: (String value) {
              this.password = value;
            },
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Spacer(),
              forgotPassword(context),
            ],
          ),
          SizedBox(height: 70),
          Text(
            createdMessage,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              width: 300,
              height: 50,
              color: Colors.cyanAccent[400],
              child: FlatButton(
                child: Text("Sign in",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _submit();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

GestureDetector forgotPassword(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/ForgotPassword');
        },
        child: new Text(
          "Forgot Password?",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.grey[400],
          ),
        ),
      );
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
