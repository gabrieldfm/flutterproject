import 'package:flutter/material.dart';
import 'package:meuapp/layout.dart';

class HomePage extends StatelessWidget{

  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {

    final content = ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.pages),
          title: Text('First one'),
          trailing: Icon(Icons.settings_applications),
        )
      ],
    );
    
    return Layout.getContent(context, content);
  }

}