import 'package:flutter/material.dart';

// Define a custom Form widget.
class NutritionForm extends StatefulWidget {
  @override
  NutritionFormState createState() {
    return NutritionFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class NutritionFormState extends State<NutritionForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Container(
        height: 200,
        child: Column(
          children: [
            // Add TextFormFields and RaisedButton here.
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
