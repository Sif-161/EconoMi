import 'package:flutter/material.dart';
import '../componentes/drawer.dart';
import 'tela_calendario.dart';
import 'tela_adicionar.dart';
import'../componentes/appbar_personalizada.dart';

class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  late ThemeData themeData;
  
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Controle Financeiro',
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder:(context) => const TelaCalendario(),)
              );
            }, 
            icon: 
          Icon(Icons.calendar_month, color: themeData.colorScheme.inverseSurface),
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
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}