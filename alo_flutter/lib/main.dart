import 'package:aloflutter/CadastroApp.dart';
import 'package:aloflutter/ContadorApp.dart';
import 'package:aloflutter/Disciplina.dart';
import 'package:aloflutter/DisciplinaApp.dart';
import 'package:aloflutter/RoteadorApp.dart';
import 'package:flutter/material.dart';
import 'AloFlutterApp.dart';
import 'DadoApp.dart';

import 'dart:convert' as convert;

void main() {

  var disciplina = Disciplina(10, 'Mobile', 'SI');
  print (disciplina.toMap());

  // convertendo uma String JSON para Map<String, dynamic>
  var fruta = '{"nome":"Abacate", "preco": 10.0}';
  var obj = convert.json.decode(fruta);
  print('${obj['nome']}, ${obj['preco']}');

  //runApp(AloFlutterApp());

  // exemplo de uso de formulários
  //runApp(CadastroApp());

  // exemplo do uso de rotas
  //runApp(RoteadorApp());

  // exemplo do uso de persistencia
  runApp(DisciplinaApp());

}