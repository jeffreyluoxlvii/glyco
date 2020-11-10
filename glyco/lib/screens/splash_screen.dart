import 'package:flutter/material.dart';

//Author: Justin Wu

//This class creates a splash screen that is shown when waiting for fetched data to be loaded.
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}
