import 'package:aloflutter/AloFlutterApp.dart';
import 'package:flutter/material.dart';

// demonstra elementos de formulário de um app Flutter
class CadastroApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Formulário de Cadastro',
      home: Scaffold(
        // SafeArea oferece uma proteção visual para a interface do app
        body: SafeArea(child: _CadastroStateful())
      )
    );

  }

}

class _CadastroStateful extends StatefulWidget {
  @override
  State<_CadastroStateful> createState() => _CadastroState();

}

class _CadastroState extends State<_CadastroStateful> {

  // variáveis de estado
  String _nome = '';
  // 0 = Comum, 1 = VIP e 2 = Pro
  int _tipoConta = -1;
  // débito em conta
  bool _debitoConta = false;

  // define uma chave única global para o formulário
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // cria um formulário com diversos campos dentro de Column
    return Form(
      // associar a chave criada (_formKey) ao formulário
      key: _formKey,
      child: Column(
        children: <Widget>[
          // itens do form são definidos aqui...
          Text('Informe seu nome:'),
          TextFormField(
            // permite definir uma regra de validaçao para o valor informado pelo usuário no campo
            validator: (valor) {
              print ('Nome: $valor');
              if (valor.isEmpty) {
                return 'Nome é obrigatório!';
              } else if (valor.length < 10) {
                return 'Nome deve ser completo!';
              }else {
                setState(() {
                  _nome = valor;
                });
                return null;
              }
            }
          ),
          // botão para validação / processamento dos dados do form
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            RaisedButton(
                onPressed: () {
                  print('Estado atual: ${_formKey.currentState}');
                  // verifica se as regras de validação (validator) foram obedecidas
                  if (_formKey.currentState.validate()){

                    // caso tenha sido validado então processa o formulário
                    // exibe uma mensagem em um Snackbar como exemplo
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Enviado... $_tipoConta')));

                    // abre uma segunda tela... no caso o AloFlutterApp
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AloFlutterApp()
                    )
                    );

                  }
                },
                // Conteúdo do RainsedButton
                child: Text('Enviar')
            ),
            FlatButton(onPressed: () { print ('ok'); },
                child: Icon(Icons.delete),
                color: Colors.lightGreen,
                textColor: Colors.white)

          ]
          ),
          // Exemplo de Radio button
          Row(
            children: <Widget>[
              // value é o valor associado ao item que o Radio representa
              // groupValue é o valor atual selecionado no grupo de Radios
              Radio(value: 0, groupValue: _tipoConta,
              // valor alterado val representa o valor (value) do Radio selecionado
              onChanged: (val){
                // atualiza a UI
                setState(() {
                  _tipoConta = val;
                });
              }),
              Text('Comum'),
              Radio(value: 1, groupValue: _tipoConta,
              onChanged: (val){
                // atualiza a UI
                setState(() {
                  _tipoConta = val;
                });
              }),
              Text('VIP'),
              Radio(value: 2, groupValue: _tipoConta,
              onChanged: (val){
                // atualiza a UI
                setState(() {
                  _tipoConta = val;
                });
              }),
              Text('Pro')
            ]
          ),
          // Exemplo de checkbox
          Row(children: <Widget>[
            Checkbox(
              value: _debitoConta,
              onChanged: (val) {
                setState(() {
                  _debitoConta = val;
                });
              }
            ),
            Text('Débito em conta')
          ]),
          // Exemplo de Image
          Row(children: <Widget>[
            Image(width: 100,
                height: 100,
                image: NetworkImage('https://flutter.dev/images/flutter-logo-sharing.png')
            ),
            Image(width: 50,
                height: 50,
                image: AssetImage('assets/images/flutter.png')
            )

          ])

    ]
      )
    );

  }

}