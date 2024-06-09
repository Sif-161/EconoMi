import 'package:flutter/material.dart';
import '../componentes/drawer.dart';
import 'tela_calendario.dart';
import 'tela_adicionar.dart';

class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

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
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaCalendario()),
              );
            },
            icon: const Icon(Icons.calendar_month), 
          )
        ],
      ),
      drawer: const Drawer(
        child: TelaDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaAdicionar()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}