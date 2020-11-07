import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/options.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Define a custom Form widget.
class ExerciseShortcutForm extends StatefulWidget {
  @override
  ExerciseShortcutFormState createState() {
    return ExerciseShortcutFormState();
  }
}

class ExerciseShortcutFormState extends State<ExerciseShortcutForm> {
  final _carbsFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _minutes;

  @override
  void dispose() {
    _carbsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Options>(context).settings;

    void _submitForm() {
      final isValid = _form.currentState.validate();
      if (!isValid) {
        return;
      }
      _form.currentState.save();
      settings.setExerciseTime(_minutes);
      Navigator.of(context).pop();
    }

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
                  _minutes = int.parse(value);
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_carbsFocusNode);
                },
                decoration: InputDecoration(
                  labelText: 'Enter minutes of exercise',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
