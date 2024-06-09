import 'package:flutter/material.dart';
import '../componentes/drawer.dart';
import 'tela_calendario.dart';
import 'tela_adicionar.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

  @override

  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  late ThemeData themeData;

  /*personalização da appbar para quando 
  o tema estiver claro a appbar ficara azul
  (obs: utilizar em todas as telas que possuam uma appbar)
  */
  
  AppBar buildAppBar(BuildContext context) {
    final themeData = Theme.of(context);
    final themeMode = AdaptiveTheme.of(context).mode;

    Color backgroundColor;
    if (themeMode == AdaptiveThemeMode.light) {
      backgroundColor = Colors.blue;
    } else if (themeMode == AdaptiveThemeMode.dark) {
      backgroundColor = themeData.colorScheme.surface;
    } else if (themeMode == AdaptiveThemeMode.system) {
      backgroundColor = MediaQuery.platformBrightnessOf(context) == Brightness.light
        ? themeData.colorScheme.primary
        : themeData.colorScheme.surface;
    } else {
      backgroundColor = themeData.colorScheme.surface;
    }
    return AppBar(
      backgroundColor: backgroundColor,
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
          icon: Icon(Icons.calendar_month, color: themeData.colorScheme.inverseSurface), 
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: buildAppBar(context),
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