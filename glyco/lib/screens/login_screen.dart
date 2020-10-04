import 'package:flutter/material.dart';
import '../widgets/appBars/plain_app_bar.dart';

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
          Image.asset(
            'assets/images/glyco_vector.jpg',
            height: 250,
            width: 250,
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
}

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  var enteredPassword;
  @override
  Widget build(BuildContext context) {
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
              }),
          TextFormField(
              obscureText: true,
              decoration: formDecorator("password"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter a password";
                } else {
                  enteredPassword = value;
                }
                return null;
              }),
          SizedBox(height: 10),
          Row(
            children: [
              Spacer(),
              forgotPassword(context),
            ],
          ),
          SizedBox(height: 70),
          signInButton(context),
        ],
      ),
    );
  }
}

ClipRRect signInButton(BuildContext context) {
  return ClipRRect(
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
          Navigator.pushReplacementNamed(context, '/NavScreen');
        },
      ),
    ),
  );
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

GestureDetector createAccount(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/CreateAccount');
      //print("Create account");
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
