import 'package:aloflutter/ItemMenu.dart';
import 'package:flutter/material.dart';

class MenuSuspensoWidget extends StatelessWidget {

  // montar a lista dos itens que serão exibidos no menu
  final List<ItemMenu> itensMenu = [ItemMenu("Configuração", Icon(Icons.audiotrack, color: Colors.blue)),
                                    ItemMenu("Busca", Icon(Icons.search, color: Colors.blue)),
                                    ItemMenu("Contato", Icon(Icons.contact_mail, color: Colors.blue))];

  @override
  Widget build(BuildContext context) {

    // representa um menu suspenso (pop-up)
    return PopupMenuButton(
      onSelected: (ItemMenu item){
        print (item.titulo);
      },
        icon: Icon(Icons.view_list),
        // como cada ItemMenu (dado) será exibido graficamente
        itemBuilder: (BuildContext context){
                // percorre cada elemento (ItemMenu) de itensMenu
                return itensMenu.map((ItemMenu item) {

                  // dizer como cada item do menu será exibido
                  return PopupMenuItem<ItemMenu>(

                    value: item,
                    child: Row(children: <Widget>[
                      item.icone,
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text(item.titulo)
                    ])

                  );

                }).toList();
        }
    );

  }

}