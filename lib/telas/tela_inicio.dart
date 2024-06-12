import 'package:controle_financeiro/modelos/lista_modelos.dart';
import 'package:controle_financeiro/servicos/fireStore_servico.dart';
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
  final FireSoreServico servico = FireSoreServico();

  final iconeMap = {
    'Comida' : Icons.dining,
    'Compras' : Icons.shopping_cart,
    'Roupas' : Icons.checkroom,
    'Viagens' : Icons.airplane_ticket,
    'Estimação' : Icons.pets,
    'Carro' : Icons.directions_car,
    'Saúde' : Icons.local_hospital,
    'Eletrônicos' : Icons.phone_android,
    'Transporte' : Icons.directions_bus,
    'Educação' : Icons.school,
    'Lazer' : Icons.beach_access,
    'Salário' : Icons.monetization_on,
    'Investimentos' : Icons.trending_up,
    'Meio Período' : Icons.access_time,
    'Prêmios' : Icons.card_giftcard,
  };

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
      body:  StreamBuilder(
        stream: servico.conectarStreamDespesas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
              List<AdicionarModelo> listaItens = [];

              for(var doc in snapshot.data!.docs) {
                listaItens.add(AdicionarModelo.fromMap(doc.data()));
              }
              return ListView(
                children :List.generate(
                  listaItens.length,
                  (index){
                    AdicionarModelo adicionarModelo = listaItens[index];
                    return SingleChildScrollView(
                      child: ListTile(
                        leading: Material(
                          shape: const CircleBorder(),
                          color: adicionarModelo.categoria == 'Despesas'
                          ? Colors.red.withOpacity(0.4) 
                          : Colors.blue.withOpacity(0.4),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(iconeMap[adicionarModelo.tipo]!, size: 28,),
                          ),
                        ),
                        title: Text(adicionarModelo.nota?.isNotEmpty == true? adicionarModelo.nota! : adicionarModelo.tipo),
                        trailing: Text(
                          adicionarModelo.categoria == 'Despesas'
                          ? '-${adicionarModelo.valor.toString()}'
                          : adicionarModelo.valor.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    );
                  })
              );
            } else {
              return const Center(child: Text('Ainda nenhuma item adicionado!'));
            }
          }
        },
      ),
    );
  }
}