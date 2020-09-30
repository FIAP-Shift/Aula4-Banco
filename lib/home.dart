import 'package:flutter/material.dart';
import 'package:flutter_shift_bd/util/customWidgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Persistência"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: buildSvgIcon("images/sqlite-icon.svg"),
            title: Text("SQLite"),
            subtitle: Text("Lista de Pessoas"),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/sqlite");
            },
          ),
          Divider(
            height: 1,
            color: Colors.black54,
          ),
          ListTile(
            leading: buildSvgIcon("images/db.svg"),
            title: Text("Floor"),
            subtitle: Text("Lista de Livros"),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/nosql");
            },
          ),
          Divider(
            height: 1,
            color: Colors.black54,
          ),
          ListTile(
            leading: buildSvgIcon("images/firebase-icon.svg"),
            title: Text("Firebase"),
            subtitle: Text("Lista de Carros"),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/firebase");
            },
          )
        ],
      ),
    );
  }


}
