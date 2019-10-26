import 'package:flutter/material.dart';
import 'package:meuapp/layout.dart';

import 'about.dart';

class HomePage extends StatelessWidget{

  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {

    final content = Center(
      child: Column(
        children: <Widget>[
          Text('Hello'),
          RaisedButton(
            child: Text('Sobre'),
            onPressed: () {
              Navigator.of(context).pushNamed(AboutPage.tag);
            },
          )
        ],
      )
    );
    
    return Layout.getContent(context, content);
  }

}