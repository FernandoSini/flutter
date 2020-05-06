import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }

}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
        TextFormField(
        validator: (value) {
    if (value.isEmpty) {
    return 'Informe o username!';
    }
    return null;
    },
    ),
    TextFormField(
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe a senha!';
        }
        return null;
      },
    ),
    RaisedButton(
    onPressed: () {
    if (_formKey.currentState.validate()) {

    Scaffold
        .of(context)
        .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
    },
    child: Text('Submit'),
    )


    ]
        )
    );
  }

}