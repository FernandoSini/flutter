import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'Disciplina.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class DisciplinaApp extends StatelessWidget {

  // método para criar / abrir o banco de dados SQLite
  // async - declara o métodos como sendo assíncrono
  Future<Database> getDB() async {

    // bloquear localmente até que o bd seja aberto
    var dbOK = await openDatabase('DisciplinaDB',
      onCreate: (db, versao) {
        db.execute('CREATE TABLE TAB_DISCIPLINA (ID INTEGER PRIMARY KEY, NOME TEXT, CURSO TEXT)');
      },onOpen: (db) {
        print('Banco de dados aberto');
      },
      version: 1);

    return dbOK;

  }

  // insere uma disciplina no BD
  Future<int> inserir(Database db, Disciplina disciplina) async {
    var id = await db.insert('TAB_DISCIPLINA', disciplina.toMap());
    print('Inserida ${disciplina} - ${id}');
    return id;
  }

  // lista todas as disciplinas inseridas na tabela TAB_DISCIPLINA
  Future<List<Map<String, dynamic>>> listar(Database db) async {
    return await db.query('TAB_DISCIPLINA');
  }

  // efetua uma requisição GET para obter marcas de veiculos
  Future<String> obterMarcas() async {

    final URL_1 = 'http://fipeapi.appspot.com/api/1/carros/marcas.json';
    // aguarda o retorno do GET...
    var ret = await http.get(URL_1);
    // body representa o corpo da resposta de uma requisição
    return ret.body;

  }

  // obtem o token para acesso ao BD Cloudant
  Future<String> getTokenCloudant() async {

    // aguarda o retorno do POST...
    var ret = await http.post('https://iam.cloud.ibm.com/identity/token',
    headers: <String, String> {'Content-Type' : 'application/x-www-form-urlencoded', 'Accept' : 'application/json'},
    body: 'grant_type=urn:ibm:params:oauth:grant-type:apikey&apikey=Xr2sCDVqJDiWJC4tOEP1u3v7zrY8QcLC6nh7BLD18N1m');

    if (ret.statusCode == 200) { // 200 = OK!
      return convert.json.decode(ret.body)['access_token'];
    } else {
      throw Exception('Erro ao obter token!');
    }

  }

  // obtem todos os bancos de dados na instancia do cloudant
  Future<String> getCloudantDBs(String token) async {

    final url = 'https://173ba38d-bc95-47ed-be32-6b364d5b6795-bluemix.cloudantnosqldb.appdomain.cloud/_all_dbs';
    var ret = await http.get(url, headers: <String, String> {'Authorization' : 'Bearer $token'});

    return ret.body;
    
  }

  Database db;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(child: Text('HTTP POST'),
                onPressed: (){

                  getTokenCloudant().then((token) {

                    getCloudantDBs(token).then((value) => print (value));

                  });

                }),
            RaisedButton(child: Text('HTTP GET'),
              onPressed: (){

                obterMarcas().then((value) {
                  List<dynamic> marcas = convert.json.decode(value);
                  marcas.forEach((element) {
                    print('${element['fipe_name']}');
                  });
                });

              }),
            Divider(height: 10),
        RaisedButton(child: Text('Inserir'),
        onPressed: (){
          // insere a disciplina
          // verifica se o bd está aberto (isOpen)
          if (db != null && db.isOpen) {
            var disciplina = Disciplina(10, 'Calculo Integral', 'Matemática');
            inserir(db, disciplina).then((value) => print('Inserido: $value'));
          }
        }), RaisedButton(child: Text('Consultar'),
          onPressed: (){
            // consulta todas as disciplinas cadastradas
            if (db != null && db.isOpen) {

              // value é o resultado da consulta
              listar(db).then((value) {
                // element representa cada registro da tabela
                value.forEach((element) {
                  print(element);
                  print('Registro: ${element['ID']}, ${element['NOME']}, ${element['CURSO']}');
                });
              });

            }
          }),
        RaisedButton(child: Text('Fechar BD'),onPressed: (){
          if (db != null && db.isOpen) {
            // fecha conexao com BD
            db.close().then((value) => print('Banco fechado'));
          }
        })
      ])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.folder_open),
        onPressed: () {

            // abrir banco de dados
            // value = retorno do getDB() = Database
            getDB().then((value) => db = value);
            print('Obtendo conexao...');

        }
      )
    ));

  }

}