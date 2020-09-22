import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Glyco")
      ),
      body: loginScreen(),


    );
  }

  Widget loginScreen (){
    return Column(
      children: [
        Icon(Icons.ac_unit),
        TextField(
          decoration: InputDecoration(
            hintText: 'email',

          ),
        ), 
        TextField(
          obscureText: true,
          decoration: InputDecoration(

            hintText: 'password'
          ),
        ),
        forgotPassword(),
        signInButton(),
        createAccount(),
      ],
    );
  }

  RichText forgotPassword(){
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontStyle: FontStyle.italic
        ),
        text:'Forgot Password?',
        recognizer: TapGestureRecognizer()
          ..onTap = (){}
      )
    );
  }

  ClipRRect signInButton(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        margin: EdgeInsets.all(5),
        width: 190,
        height: 75,
        color: Colors.blue[300],
        child: FlatButton(
          child:
            Text(
              "Sign in",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )
            ),
            onPressed: (){},
        ),
      ),
    );
  }
}

RichText createAccount(){
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontStyle: FontStyle.italic
        ),
        text:'or Create an Account',
        recognizer: TapGestureRecognizer()
          ..onTap = (){}
      )
    );
  }