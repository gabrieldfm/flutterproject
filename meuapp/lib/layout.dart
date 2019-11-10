import 'package:flutter/material.dart';
import 'models/Lista.dart';

import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/settings.dart';
import 'pages/list.dart';

import 'widgets/HomeList.dart';

class Layout {
  static final pages = [HomePage.tag, AboutPage.tag, SettingsPage.tag];

  static int currItem = 0;

  static Scaffold getContent(BuildContext context, content,
      [bool showbottom = true]) {
    BottomNavigationBar bottomNavBar = BottomNavigationBar(
      currentIndex: currItem,
      fixedColor: primary(),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('Sobre')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Configurações'))
      ],
      onTap: (int i) {
        currItem = i;
        Navigator.of(context).pushReplacementNamed(pages[i]);
      },
    );

    if(!showbottom){
      currItem = 1;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Layout.primary(),
        title: Center(
          child: Text('Lista compras'),
        ),
        actions: _getActions(context),
      ),
      bottomNavigationBar: showbottom ? bottomNavBar : null,
      body: content,
    );
  }

  static List<Widget> _getActions(BuildContext context) {
    List<Widget> items = List<Widget>();

    if (pages[currItem] != HomePage.tag) {
      return items;
    }

    TextEditingController _controller = TextEditingController();

    items.add(GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext ctx) {
              final input = TextFormField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Nome',
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              );

              return AlertDialog(
                title: Text('Nome da lista'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[input],
                  ),
                ),
                actions: <Widget>[
                  RaisedButton(
                    color: secondary(),
                    child: Text('Cancelar', style: TextStyle(color: light())),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  RaisedButton(
                    color: primary(),
                    child: Text('Adicionar', style: TextStyle(color: light())),
                    onPressed: () {
                      HomeList.items.add(ListTile(
                        leading: Icon(Icons.pages),
                        title: Text(_controller.text),
                        trailing: Icon(Icons.more_vert),
                        onTap: () {
                          Navigator.of(context).pushNamed(ListPage.tag);
                        },
                      ));

                      Navigator.of(context).popAndPushNamed(HomePage.tag);
                    },
                  )
                ],
              );
            });
      },
      child: Icon(Icons.add),
    ));

    items.add(Padding(padding: EdgeInsets.only(right: 20)));

    return items;
  }

  static Color primary([double opacity = 1]) =>
      Color.fromRGBO(62, 63, 89, opacity);
  static Color secondary([double opacity = 1]) =>
      Color.fromRGBO(150, 150, 150, opacity);
  static Color light([double opacity = 1]) =>
      Color.fromRGBO(242, 234, 228, opacity);
  static Color dark([double opacity = 1]) =>
      Color.fromRGBO(51, 51, 51, opacity);

  static Color danger([double opacity = 1]) =>
      Color.fromRGBO(217, 74, 74, opacity);
  static Color success([double opacity = 1]) =>
      Color.fromRGBO(6, 166, 59, opacity);
  static Color info([double opacity = 1]) =>
      Color.fromRGBO(0, 122, 166, opacity);
  static Color warning([double opacity = 1]) =>
      Color.fromRGBO(166, 134, 0, opacity);
}
