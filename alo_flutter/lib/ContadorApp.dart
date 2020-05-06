import 'package:flutter/material.dart';

class ContadorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _ContadorStateful()
        )
      )
    );
  }

}

// cria uma classe privada do tipo StatefulWidget
class _ContadorStateful extends StatefulWidget {
  // todos StatefulWidget devem iniciar o seus dados (estado) inicialmente
  @override
  State<_ContadorStateful> createState() => _ContadorState();

}

// criar a representação do estado do objeto
class _ContadorState extends State<_ContadorStateful>{

  // define as variaveis de estado
  var _contador = 0;

  _ContadorState() {
    this._contador = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // alinha ao centro
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.exposure_neg_1),
            onPressed: (){
              // atualiza na interface as alterações nas variáveis de estado
              setState(() {
                // decrementa o contador e dispara a atualização na interface
                _contador--;
              });
            }
        ),
        // exibe o conteúdo ($) da variável _contador
        Text('$_contador'),
        IconButton(
          icon: Icon(Icons.exposure_plus_1),
          onPressed: (){
            // atualiza na interface as alterações nas variáveis de estado
            setState(() {
              // incrementa o contador e dispara a atualização na interface
              _contador++;
            });
          }
        )
      ],
    );
  }

}