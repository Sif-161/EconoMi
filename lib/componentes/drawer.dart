import 'package:controle_financeiro/servicos/autenticacao_servico.dart';

import '../telas/tela_config.dart';
import 'package:flutter/material.dart';
import '../telas/tela_inicio.dart';

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
            MaterialPageRoute(builder: (context) => const TelaInicio()),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.pie_chart, color: Colors.blue),
          title: const Text('Grafico'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.receipt_long, color: Colors.blue),
          title: const Text('Relatorio'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.blue),
          title: const Text('Configurações'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaConfig()),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.blue),
          title: const Text('Sair'),
          onTap: () {
            AutenticacaoServico().deslogarUsuario();
          },
        ),
      ],
    );
    return drawerItens;
  }
}