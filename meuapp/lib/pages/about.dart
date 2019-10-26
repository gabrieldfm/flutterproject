import 'package:flutter/material.dart';
import 'package:meuapp/layout.dart';

class AboutPage extends StatelessWidget{

  static String tag = 'about-page';

  @override
  Widget build(BuildContext context) {
    return Layout.getContent(context, Center(
      child: Text('este app foi criado pela equipe adotapet'),
    ));
  }
}