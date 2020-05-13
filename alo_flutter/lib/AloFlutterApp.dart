import 'package:aloflutter/MenuSuspensoWidget.dart';
import 'package:flutter/material.dart';

// StatelessWidget não manipula nem retém dados (sem estado)
class AloFlutterApp extends StatelessWidget {

  // Onde a interface (UI) é construída
  @override
  Widget build(BuildContext context) {

    // Utilizar o tipo de aplicação MaterialApp
    // que segue os padrões do Material Design
    return MaterialApp(
      // desabilita a faixa "debug" no canto superior direito
      debugShowCheckedModeBanner: false,
      // define o conteúdo principal da aplicação (tela inicial)
      // Scaffold é um gerenciador de layout
      home: Scaffold(
        // defina a barra (superior) do app
        appBar: AppBar(
        title: Text('Alo Flutter 3'),
        leading: MenuSuspensoWidget(),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search))
          ],
            flexibleSpace: SafeArea(child: IconButton(icon:Icon(Icons.map), iconSize: 30.0))
        ),
        // define o conteúdo central
        body: Center(child: Container(
            height: 100.0,
            width: 100.0,
            alignment: Alignment.center,
            child: RichText(text: TextSpan(text: 'Boa', style: TextStyle(color: Colors.red),
            children: <TextSpan>[TextSpan(text: ' Noite', style: TextStyle(color: Colors.blue))]
            )),
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                border: Border.all(color: Colors.black,width: 4),
                borderRadius: BorderRadius.circular(10)))
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))))
      ),
        // cria uma barra de navegação inferior
        bottomNavigationBar: BottomAppBar(
          // cria uma linha (Row) com os elementos lado a lado
            child: Row(
              // define a lista de Widgets a serem exibidos na Row
              children: <Widget>[
                Text('Home'),
                Text('Cadastro'),
                IconButton(
                  icon: Icon(Icons.verified_user),
                  onPressed: () {
                      print('Botão pressionado!');
                  }
                )
              ]
            )
        ),
        // botão suspenso na parte inferior (atalho)
        floatingActionButton: FloatingActionButton(
          // define o ícone a ser exibido no botão (FloatingActionButton)
          child: Icon (Icons.refresh),
          // trata o evento de touch (click)
          onPressed: () {
            print('Botão pressionado!');
            // fecha a tela atual....
            Navigator.pop(context);
          }
        ),
        // cria uma barra de botões na parte inferior da interface
        persistentFooterButtons: <Widget>[
          IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                print('Botão pressionado!');
              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Botão pressionado!');
              }
          )
        ]
      )
    );

  }

}