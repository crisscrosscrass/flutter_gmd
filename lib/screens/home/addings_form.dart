import 'package:flutter/material.dart';
import 'package:gmd/services/auth.dart';
import 'package:gmd/shared/constant.dart';

class AddingsForm extends StatefulWidget {
  @override
  _AddingsFormState createState() => _AddingsFormState();
}

class _AddingsFormState extends State<AddingsForm> {
  final AuthService _auth = AuthService();
  String _currentEmail = "";
  String _currentPassword = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Text(
            'Create new project',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: '',
            decoration: textInputDecoration.copyWith(hintText: 'email'),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentEmail = val),
          ),
          TextFormField(
            initialValue: '',
            decoration: textInputDecoration.copyWith(hintText: 'password'),
            validator: (val) => val.isEmpty ? 'Please enter a password' : null,
            onChanged: (val) => setState(() => _currentPassword = val),
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentEmail);
              print(_currentPassword);
              dynamic result = await _auth.registerWithEmailAndPassword(
                  _currentEmail, _currentPassword);
              if (result == null) {
                print("something went wrong");
              }
            },
          ),
        ],
      ),
    );
  }
}
