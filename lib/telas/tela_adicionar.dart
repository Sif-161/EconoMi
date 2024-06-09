import 'package:flutter/material.dart';
import 'package:controle_financeiro/componentes/botoes_adicionar.dart';


class TelaAdicionar extends StatefulWidget{
  const TelaAdicionar({super.key});

  @override
  State<StatefulWidget> createState() => TelaAdicionarState();
}

class TelaAdicionarState extends State<TelaAdicionar>{
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancelar',
            style: TextStyle(
              color: themeData.colorScheme.inverseSurface,
              fontSize: 14,
            ),
          ),
        ),
        title: const Text('Adicionar'),
      ),
      body: GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          crossAxisCount: 3,
            children: const [
              CustomIconButton(
                icon: Icons.dining,
                label: 'Comida',
              ),
              CustomIconButton(
                icon: Icons.shopping_cart,
                label: 'Compras',
              ),
              CustomIconButton(
                icon: Icons.checkroom,
                label: 'Roupas',
              ),
              CustomIconButton(
                icon: Icons.airplane_ticket,
                label: 'Viagens',
              ),
              CustomIconButton(
                icon: Icons.pets,
                label: 'Estimação',
              ),
              CustomIconButton(
                icon: Icons.directions_car,
                label: 'Carro',
              ),
              CustomIconButton(
                icon: Icons.local_hospital,
                label: 'Saúde',
              ),
              CustomIconButton(
                icon: Icons.phone_android,
                label: 'Eletrônicos',
              ),
              CustomIconButton(
                icon: Icons.directions_bus,
                label: 'Transporte',
              ),
              CustomIconButton(
                icon: Icons.school,
                label: 'Educação',
              ),
            ],
        ),
    );
  }
}