import 'package:flutter/material.dart';
import 'package:youtube_clone/telas/Biblioteca.dart';
import 'package:youtube_clone/telas/EmAlta.dart';
import 'package:youtube_clone/telas/Inicio.dart';
import 'package:youtube_clone/telas/Inscricoes.dart';

import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceatual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          width: 100,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res;
                });
                //print("resultado digitado");
              }),

          /*IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                print("videocam");
              }),
          
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print("account");
              }),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceatual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceatual,
          onTap: (indice) {
            setState(() {
              _indiceatual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              title: Text("Home"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              title: Text("em alta"),
              icon: Icon(Icons.whatshot),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              title: Text("inscrições"),
              icon: Icon(Icons.subscriptions),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              title: Text("biblioteca"),
              icon: Icon(Icons.folder),
            ),
          ]),
    );
  }
}
