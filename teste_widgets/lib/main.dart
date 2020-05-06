import 'package:flutter/material.dart';
import 'package:testewidgets/LoginForm.dart';
import 'MenuItem.dart';
import 'MenuOpcoes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: LoginForm()
          )

        ])
      )
    );
  }
}

