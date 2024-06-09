import 'package:controle_financeiro/servicos/autenticacao_servico.dart';
import '../telas/tela_config.dart';
import 'package:flutter/material.dart';
import '../telas/tela_inicio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaDrawer extends StatelessWidget {
  const TelaDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final AutenticacaoServico autenticacaoServico = AutenticacaoServico();
    final User? currentUser = autenticacaoServico.firebaseAuth.currentUser;

      final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text(currentUser != null ? currentUser.displayName ?? '' : ''),
      accountEmail: Text(currentUser != null ? currentUser.email ?? '' : ''),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: currentUser != null
            ? currentUser.photoURL != null
                ? Image.network(currentUser.photoURL!)
                : const FlutterLogo(size: 42.0)
            : const FlutterLogo(size: 42.0),
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
    /* Adicionar os itens do drawer em todas as telas */
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
            MaterialPageRoute(builder: (context) => const TelaConfig()),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.blue),
          title: const Text('Sair'),
          onTap: () {
            autenticacaoServico.deslogarUsuario();
          },
        ),
      ],
    );
    return drawerItens;
  }
}