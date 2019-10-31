import 'package:flutter/material.dart';

import 'layout.dart';
import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/settings.dart';
import 'pages/list.dart';

void main() => runApp(AdotaPet());

class AdotaPet extends StatelessWidget{

  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    AboutPage.tag: (context) => AboutPage(),
    SettingsPage.tag: (context) => SettingsPage(),
    ListPage.tag: (context) => ListPage(),
  };

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'AdotaPet',
      theme: ThemeData(
        primaryColor: Layout.primary(),
        accentColor: Layout.secondary(),
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Layout.primary()),
          body1: TextStyle(fontSize: 14),
        )
      ),
      home: HomePage(),
      routes: routes,
    );
  }

}
  
