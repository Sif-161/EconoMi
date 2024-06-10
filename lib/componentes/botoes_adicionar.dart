import 'package:flutter/material.dart';
import '../telas/tela_inicio.dart';
import '../componentes/decoracao_campo_autentificacao.dart';
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
                            decoration: getAuthenticationInputDecoration('Descrição', context),
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
                            decoration: getAuthenticationInputDecoration('Valor', context),
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
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          );
                          if (pickedDate!= null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const TelaInicio()),
                          );
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