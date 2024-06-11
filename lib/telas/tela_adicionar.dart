import 'package:flutter/material.dart';
import 'package:controle_financeiro/componentes/botoes_adicionar.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import'../componentes/appbar_personalizada.dart';

class TelaAdicionar extends StatefulWidget{
  const TelaAdicionar({super.key});

  @override
  State<StatefulWidget> createState() => TelaAdicionarState();
}

class TelaAdicionarState extends State<TelaAdicionar>{
  late ThemeData themeData;
  int _currentSegment = 0;

  //lista dos botões organizada por grupo
  final List<List<CustomIconButton>> _iconButtonGroups = [
    const [
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
    const [
      CustomIconButton(
        icon: Icons.monetization_on, 
        label: 'Salário'
      ),
      CustomIconButton(
        icon: Icons.trending_up, 
        label: 'Investimentos'
      ),
      CustomIconButton(
        icon: Icons.access_time, 
        label: 'Meio Período'
      ),
      CustomIconButton(
        icon: Icons.card_giftcard, 
        label: 'Prêmios'
      ),
    ]
  ];

  //personalização da appbar para quando o tema estiver claro a appbar ficara azul
  
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancelar',
            style: TextStyle(
              color: themeData.colorScheme.inverseSurface,
              fontSize: 14,
              fontWeight: FontWeight.normal
            ),
          )
        ),
        title: 'Adicionar',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSlidingSegmentedControl(
              children: const {
                0: Text('Despesas'),
                1: Text('Rendas'),
              }, 
              decoration: BoxDecoration(
                color: themeData.colorScheme.background,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: themeData.colorScheme.inverseSurface,
                    spreadRadius: 1.5
                  )
                ]
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    spreadRadius: 1.5,
                    offset: const Offset(
                      0.0,
                      0.2,
                    )
                  )   
                ]
              ),
              onValueChanged: (value) {
                setState(() {
                  _currentSegment = value;
                });
              },
              initialValue: _currentSegment,
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              crossAxisCount: 3,
              children: _iconButtonGroups[_currentSegment],
            ),
          )
        ]
      )
    );
  }
}