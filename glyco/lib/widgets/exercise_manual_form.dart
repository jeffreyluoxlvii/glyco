import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/measurement.dart';
import 'package:glyco/providers/auth.dart';

// Define a custom Form widget.
class ExerciseManualForm extends StatefulWidget {
  @override
  ExerciseManualFormState createState() {
    return ExerciseManualFormState();
  }
}

class ExerciseManualFormState extends State<ExerciseManualForm> {
  final _form = GlobalKey<FormState>();

  var _exercise;

  void _submitForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    Provider.of<Measurement>(context, listen: false).setExercise(
        _exercise, Provider.of<Auth>(context, listen: false).token);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _form,
      child: Container(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Add TextFormFields and RaisedButton here.
              Icon(
                FontAwesomeIcons.running,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Please enter a value greater than 0.';
                  }
                  if (int.parse(value) > 9999) {
                    return 'Please enter a value less than 10000.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _exercise = int.parse(value);
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Edit minutes of exercise',
                  suffix: Text(
                    'minutes',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
