import 'package:flutter/material.dart';

import 'package:meuapp/layout.dart';

class ListPage extends StatefulWidget {
  static String tag = 'list-page';

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final content = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Pesquisar'),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 300,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: GestureDetector(
                    child: Icon(Icons.adjust, color: Colors.green,),
                    onTap: (){
                      print('adquirido');
                    },
                  ),
                  title: Text('Nome do item'),
                  subtitle: Text('4 x R\$ 1,50 = R\$ 6,00'),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: () {
                      print('deletar');
                    },
                  ),
                  onLongPress: () {
                    print('Editar');
                  },
                )
              ],
            ),
          ),
          Container(
            color: Colors.deepOrange,
            height: 80,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width /2,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Total de itens: 1'),
                      Text('Já adquirido: 0')
                    ],
                  ),
                ),
                Container(
                  color: Colors.indigo,
                  width: MediaQuery.of(context).size.width /2,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Total: R\$ 15,00', style: TextStyle(fontSize: 24),),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

    return Layout.getContent(context, content, false);
  }
}
