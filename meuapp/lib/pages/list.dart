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
    final content = Column(
      children: <Widget>[
        SizedBox(
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Pesquisar'),
          ),
        ),
        Container(
          color: Colors.blueGrey,
          height: MediaQuery.of(context).size.height - 300,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.adjust),
                title: Text('Nome do item'),
              )
            ],
          ),
        ),
      ],
    );

    return Layout.getContent(context, content, false);
  }
}
