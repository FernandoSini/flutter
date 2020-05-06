import 'package:flutter/material.dart';
// Random permite sortear números
import 'dart:math' show Random;

class DadoApp extends StatelessWidget {

  // cria a interface visual
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: _DadoStateful()
    );

  }

}

class _DadoStateful extends StatefulWidget {
  @override
  State<_DadoStateful> createState() => _DadoState();

}

class _DadoState extends State<_DadoStateful>{

  // variaveis de estado que representa a face do dado sorteado
  int _face = 0;
  var rnd = new Random();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FaceDadoWidget(face: _face),
      floatingActionButton: FloatingActionButton(child: IconButton(icon: Icon(Icons.autorenew)),
      onPressed: (){
        setState(() {
          _face = rnd.nextInt(6) + 1;
        });

      })
    );

  }

}

class FaceDadoWidget extends StatelessWidget {
  const FaceDadoWidget({
    Key key,
    @required int face,
  }) : _face = face, super(key: key);

  final int _face;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$_face',
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 30.0,
          backgroundColor: Colors.black12
        )));
  }
}