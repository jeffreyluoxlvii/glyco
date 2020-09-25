import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Glyco")),
      body: loginScreen(context),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget loginScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/pepe.jpg',
            height: 250,
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'password'),
            ),
          ),
          forgotPassword(),
          SizedBox(height: 100),
          signInButton(context),
          createAccount(),
        ],
      ),
    );
  }

  RichText forgotPassword() {
    return RichText(
        text: TextSpan(
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey[700],
            ),
            text: 'Forgot Password?',
            recognizer: TapGestureRecognizer()..onTap = () {}));
  }

  ClipRRect signInButton(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        width: 300,
        height: 50,
        color: Colors.blue[300],
        child: FlatButton(
          child: Text("Sign in",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            Navigator.pushNamed(context, '/NavScreen');
          },
        ),
      ),
    );
  }
}

RichText createAccount() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),
      text: 'or Create an Account',
      recognizer: TapGestureRecognizer()..onTap = () {},
    ),
  );
}
