import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/options.dart';
import '../../providers/auth.dart';

// Define a custom Form widget.
class ShortcutForm extends StatefulWidget {
  final IconData icon;
  final String type;

  ShortcutForm(this.icon, this.type);

  @override
  ShortcutFormState createState() {
    return ShortcutFormState();
  }
}

class ShortcutFormState extends State<ShortcutForm> {
  final _form = GlobalKey<FormState>();

  var _carbs;

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Options>(context).settings;

    void _submitForm() {
      final isValid = _form.currentState.validate();
      if (!isValid) {
        return;
      }
      _form.currentState.save();
      if (widget.type == "MEAL") {
        //settings.setMealSettings(_carbs);
        settings.setMealSettings(
            _carbs, Provider.of<Auth>(context, listen: false).token);
      }
      if (widget.type == "SNACK") {
        settings.setSnackSettings(
            _carbs, Provider.of<Auth>(context, listen: false).token);
      }
      if (widget.type == "DRINK") {
        settings.setDrinkSettings(
            _carbs, Provider.of<Auth>(context, listen: false).token);
      }
      Navigator.of(context).pop();
    }

    return Form(
      key: _form,
      child: Container(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(
                widget.icon,
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
                  _carbs = int.parse(value);
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter carbs',
                  suffix: Text(
                    'g',
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
