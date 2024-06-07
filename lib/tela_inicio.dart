import 'package:flutter/material.dart';
import 'drawer.dart';

class TelaInicio extends StatefulWidget {
  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Controle Financeiro'),
      ),
      drawer: Drawer(
        child: TelaDrawer(),
      ),
    );
  }
}