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

    final content = Container(
      color: Colors.blueGrey,
    );

    return Layout.getContent(context, content);
  }
}
