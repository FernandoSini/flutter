import 'package:flutter/material.dart';

class RoteadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // rota (tela) inicial será o "/"
      initialRoute: "/",
      routes: {
        // primeira rota sera o _Raiz
        "/": (context) => _Raiz(),
        "/rota1": (context) => _Rota1(),
        "/rota2": (context) => _Rota2(),
        "/cardapio": (context) => _Cardapio(),
        "/pedido": (context) => _PedidoStack()
      }
    );
  }

}

class _Raiz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Raiz', textAlign: TextAlign.center),
              RaisedButton(child: Text('Rota 1'),
              onPressed: (){
                // avança para _Rota1 mapeado como /rota1
                Navigator.pushNamed(context, '/rota1', arguments: _Mensagem("Conteudo da rota 1"));
              }),
              RaisedButton(child: Text('Rota 2'),
              onPressed: (){
                // avança para _Rota2 mapeado como /rota2
                Navigator.pushNamed(context, '/rota2');
              }),
              RaisedButton(child: Text('Cardapio'),
                  onPressed: (){
                    // avança para _Cardapio mapeado como /cardapio
                    Navigator.pushNamed(context, '/cardapio');
                  }),
              RaisedButton(child: Text('Pedido'),
                  onPressed: (){
                    // avança para _Pedido mapeado como /pedido
                    Navigator.pushNamed(context, '/pedido');
                  })
        ])
      )
    );
  }

}

class _Rota1 extends StatelessWidget {

  // criar um ListView "manualmente"
  ListView criarListView() {
    return
      ListView(children: <Widget>[
        Text('Exemplo'),
        ListTile(leading: Icon(Icons.autorenew), title: Text('Item 1'), subtitle: Text('Sub item 1')),
        ListTile(leading: Icon(Icons.map), title: Text('Item 2')),
        ListTile(leading: Image(width: 50,
            height: 50,
            image: AssetImage('assets/images/flutter.png')
        ), title: Text('Item 3'))

      ]
      );
  }

  // criar um ListView utilizando um builder
  ListView criarListViewBuilder() {

    final List<String> marcas = ['Fiat', 'Ford', 'Volvo', 'GM'];

    return ListView.builder(
      // tamanho da lista de valores (quantidade de itens)
      itemCount: marcas.length,
      // processado para cada elementos da lista (para cada uma das marcas)
      itemBuilder:(context, index) {
        return ListTile(leading: Icon(Icons.directions_car),
            title: Text('${marcas[index]}'),
        // item selecionado...
        onTap: () => print ("${marcas[index]}"));
      });

  }

  @override
  Widget build(BuildContext context) {

    // obtendo o objeto passado com parametro em arguments
    final _Mensagem msg = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('${msg.conteudo}')),
            // texto a ser exibido vem do arguments
            body: SafeArea(child:criarListViewBuilder()
            )
        )
    );
  }

}

class _Rota2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
            body: Center(child:

                Card(shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange.withOpacity(0.5))),
                child: Column(mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                    ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Desenvolvimento Mobile'),
                      subtitle: Text('Futter'),
                      onTap: (){
                        print('Ok');
                      }
                    )

                ]
                )
                )

            )
        )
    );
  }

}

class _Cardapio extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: GridView.count(crossAxisCount: 2,
              children: List.generate(10, (index) {
                return Center(
                    child: Card(
                        shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.directions_car),
                              Text("Item $index", textAlign: TextAlign.center)
                            ])
                    )

                );
              })
              )
        )
      )
    );

  }

}

class _PedidoStack extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(color: Colors.green),
          Align(child: Image(width: 50,
                height: 50,
                image: AssetImage('assets/images/flutter.png')
              ),
            alignment: Alignment.center
          ),
          Positioned(child: Container(color: Colors.red,
              height: 100,
              width: 100
          ),
          top: 30,
          left: 10)

        ])
      )
    ));
  }
}

// objetos desta classe serão passados como parâmetro para as rotas
class _Mensagem {

  String _conteudo;

  _Mensagem(this._conteudo);

  // método get (retorna o valor armazenado em _conteudo (private)
  get conteudo => _conteudo;

}