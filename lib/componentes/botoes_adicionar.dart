import 'package:controle_financeiro/modelos/categoria_modelo.dart';
import 'package:controle_financeiro/modelos/lista_modelos.dart';
import 'package:controle_financeiro/servicos/fireStore_servico.dart';
import 'package:controle_financeiro/telas/tela_inicio.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../componentes/decoracao_campo_autentificacao.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  final TextEditingController _notaCtrl = TextEditingController();
  final TextEditingController _valorCtrl = TextEditingController();

  FireSoreServico adicionarServico = FireSoreServico();

  bool isCarregando = false;
  bool _isPressed = false;
  late ThemeData themeData;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Column(
      children: [
        Material(
          shape: const CircleBorder(),
          color: _isPressed? Colors.blue : Colors.blue.withOpacity(0.2),
          elevation: 10,
          child: IconButton(
            onPressed: () {
              setState(() {
                _isPressed =!_isPressed;
              });
              _showModal().then((_){
                setState(() {
                  _isPressed = false;
                });
              });
            },
            icon: Icon(widget.icon),
            iconSize: 28,
            color: themeData.colorScheme.inverseSurface, 
          ),
        ),
        const SizedBox(height: 7.2),
        Text(
          widget.label,
          style: TextStyle(color: themeData.colorScheme.inverseSurface), 
        ),
      ],
    );
  }

  enviarClicado(){
      setState(() {
        isCarregando = true;
      });

      String nota = _notaCtrl.text;
      double valor = double.parse(_valorCtrl.text);
      CategoriaModelo categoria = Provider.of<CategoriaModelo>(context, listen: false);

      AdicionarModelo adicionar = AdicionarModelo(
        id: const Uuid().v1(),
        tipo: widget.label,
        valor: valor,
        data: selectedDate ?? DateTime.now(),
        nota: nota,
        categoria: categoria.selectedCategory,
      );

      adicionarServico.adicionarDespesas(adicionar).then((value){
        setState(() {
          isCarregando = true;
        });
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const TelaInicio()));
    }

  Future<void> _showModal() async{
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context){
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: themeData.colorScheme.surface,
              boxShadow: const [
                BoxShadow(
                  color: Colors.blue,
                  spreadRadius: 5,
                  blurRadius: 10,
                   offset: Offset(0, -10),
                )
              ]
            ),
            padding: const EdgeInsets.all(20),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.description),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            controller: _notaCtrl,
                            decoration: getAuthenticationInputDecoration('Nota', context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _valorCtrl,
                            decoration: getAuthenticationInputDecoration('Valor', context),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira um valor';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Material(
                      color: Colors.blue,
                      shape: const CircleBorder(),
                      elevation: 10,
                      child: IconButton(
                        onPressed: () {
                          
                          enviarClicado();
                        },
                        icon: Icon(Icons.check, color: themeData.colorScheme.inverseSurface),
                        iconSize: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}