import 'tela_config.dart';
import 'package:flutter/material.dart';
import 'tela_inicio.dart';

class TelaDrawer extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
     const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Odilon Struduth'),
      accountEmail: Text('netostruduth@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(size: 42.0),
      ) 
    );
    final drawerItens = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          leading: const Icon(Icons.home, color: Colors.blue,),
          title: const Text('Inicio'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaInicio()),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.pie_chart_sharp, color: Colors.blue),
          title: const Text('Grafico'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.blue),
          title: const Text('Configurações'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaConfig()),
          ),
        ),
      ],
    );
    return drawerItens;
  }
}