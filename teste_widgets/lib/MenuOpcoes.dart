import 'package:flutter/material.dart';
import 'MenuItem.dart';

class MenuOpcoes extends StatelessWidget {
  const MenuOpcoes({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Create a List of Menu Item for PopupMenuButton
    List<MenuItem> itensMenu = [
      MenuItem(title: 'Músicas', icon: Icon(Icons.audiotrack)),
      MenuItem(title: 'Fotos', icon: Icon(Icons.photo)),
      MenuItem(title: 'Alarme', icon: Icon(Icons.alarm)),
      MenuItem(title: 'Câmera', icon: Icon(Icons.camera)),
    ];

    return PopupMenuButton<MenuItem>(
      icon: Icon(Icons.view_list),
      onSelected: ((valueSelected) {
        print('valueSelected: ${valueSelected.title}');
      }),
      itemBuilder: (BuildContext context) {
        return itensMenu.map((MenuItem todoMenuItem) {
          return PopupMenuItem<MenuItem>(
            value: todoMenuItem,
            child: Row(
              children: <Widget>[
                Icon(todoMenuItem.icon.icon),
                Padding(padding: EdgeInsets.all(8.0),),
                Text(todoMenuItem.title),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}